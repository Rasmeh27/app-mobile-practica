import 'package:flutter/material.dart';

import '../../app/app_theme.dart';
import '../../controllers/quiz_controller.dart';
import '../../models/quiz_question.dart';

class QuizScreen extends StatefulWidget {
  final String title;
  final String segment;
  final String difficulty;

  const QuizScreen({
    super.key,
    required this.title,
    required this.segment,
    required this.difficulty,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final QuizController _controller;

  @override
  void initState() {
    super.initState();

    _controller = QuizController();

    _loadQuiz();
  }

  Future<void> _loadQuiz() async {
    await _controller.loadQuiz(widget.segment);

    if (!mounted) {
      return;
    }

    _controller.filterByDifficulty(
      widget.difficulty,
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        if (_controller.isLoading) {
          return Scaffold(
            backgroundColor: AppTheme.background,
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (_controller.error != null) {
          return Scaffold(
            backgroundColor: AppTheme.background,
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  _controller.error!,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }

        if (!_controller.hasQuestions) {
          return Scaffold(
            backgroundColor: AppTheme.background,
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: const Center(
              child: Text(
                'No questions available.',
              ),
            ),
          );
        }

        if (_controller.isFinished) {
          return _buildSummary();
        }

        return _buildQuiz();
      },
    );
  }

  Widget _buildQuiz() {
    final question = _controller.currentQuestion!;

    const letters = [
      'A',
      'B',
      'C',
      'D',
    ];

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${_controller.currentIndex + 1} '
                        'of ${_controller.totalQuestions}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Score: ${_controller.score}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: _controller.progress,
                  minHeight: 5,
                  backgroundColor: AppTheme.border,
                  color: AppTheme.primary,
                ),
              ),

              const SizedBox(height: 28),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.border,
                  ),
                ),
                child: Text(
                  question.text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ...List.generate(
                question.answers.length,
                    (index) {
                  final answer =
                  question.answers[index];

                  final isSelected =
                  _controller.isSelectedAnswer(
                    answer,
                  );

                  return Padding(
                    padding:
                    const EdgeInsets.only(bottom: 12),
                    child: Material(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(12),
                      child: InkWell(
                        onTap: () {
                          _controller.selectAnswer(
                            answer,
                          );
                        },
                        borderRadius:
                        BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppTheme.primary.withValues(
                              alpha: 0.08,
                            )
                                : Colors.white,
                            borderRadius:
                            BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? AppTheme.primary
                                  : AppTheme.border,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppTheme.primary
                                      : const Color(
                                    0xFFF0F0F0,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    letters[index],
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : AppTheme
                                          .textPrimary,
                                      fontWeight:
                                      FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Text(
                                  answer.text,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const Spacer(),

              Row(
                children: [
                  if (!_controller.isFirstQuestion) ...[
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton.icon(
                          onPressed:
                          _controller.previousQuestion,
                          icon: const Icon(
                            Icons.chevron_left,
                          ),
                          label: const Text(
                            'Previous',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],

                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 50,
                      child: FilledButton(
                        onPressed:
                        _controller.hasSelectedAnswer
                            ? _controller.nextQuestion
                            : null,
                        style: FilledButton.styleFrom(
                          backgroundColor:
                          AppTheme.primary,
                        ),
                        child: Text(
                          _controller.isLastQuestion
                              ? 'Finish'
                              : 'Next',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummary() {
    final percentage = _controller.percentage;

    String message;

    if (percentage >= 80) {
      message = 'Excellent!';
    } else if (percentage >= 60) {
      message = 'Good Job!';
    } else {
      message = 'Keep Trying!';
    }

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text(
          'Quiz Summary',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.home_rounded,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                color: AppTheme.primary,
                child: Column(
                  children: [
                    const Icon(
                      Icons.emoji_events_rounded,
                      size: 64,
                      color: Colors.white,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${percentage.toStringAsFixed(1)}%',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight:
                              FontWeight.w800,
                              color: percentage >= 60
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${_controller.score} out of '
                                '${_controller.totalQuestions} correct',
                            style: const TextStyle(
                              color:
                              AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _SummaryStat(
                            icon:
                            Icons.check_circle_rounded,
                            title: 'Correct',
                            value:
                            '${_controller.score}',
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _SummaryStat(
                            icon: Icons.cancel_rounded,
                            title: 'Wrong',
                            value:
                            '${_controller.wrongAnswers}',
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _SummaryStat(
                            icon:
                            Icons.quiz_rounded,
                            title: 'Total',
                            value:
                            '${_controller.totalQuestions}',
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 26),

                    const Text(
                      'Review Answers',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 16),

                    ...List.generate(
                      _controller.questions.length,
                          (index) {
                        final question =
                        _controller.questions[index];

                        return _buildReviewCard(
                          question,
                          index,
                        );
                      },
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          _controller.restartQuiz();
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor:
                          AppTheme.primary,
                        ),
                        child: const Text(
                          'Try Again',
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard(
      QuizQuestion question,
      int index,
      ) {
    final selected =
    _controller.selectedAnswerForQuestion(
      question,
    );

    final correct =
    _controller.correctAnswerForQuestion(
      question,
    );

    final isCorrect =
    _controller.isQuestionCorrect(
      question,
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 14,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isCorrect
            ? Colors.green.withValues(alpha: 0.06)
            : Colors.red.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
          isCorrect ? Colors.green : Colors.red,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isCorrect
                      ? Colors.green
                      : Colors.red,
                  borderRadius:
                  BorderRadius.circular(20),
                ),
                child: Text(
                  'Q${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Icon(
                isCorrect
                    ? Icons.check_rounded
                    : Icons.close_rounded,
                color: isCorrect
                    ? Colors.green
                    : Colors.red,
              ),

              const SizedBox(width: 6),

              Text(
                isCorrect ? 'Correct' : 'Wrong',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            question.text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          if (!isCorrect)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin:
              const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                BorderRadius.circular(8),
              ),
              child: Text(
                'Your answer: ${selected?.text ?? 'No answer'}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius:
              BorderRadius.circular(8),
            ),
            child: Text(
              'Correct answer: ${correct?.text ?? ''}',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryStat extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _SummaryStat({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.border,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 28,
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}