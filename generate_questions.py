import json
from pathlib import Path
from collections import Counter


FILES = {
    "General Knowledge": Path("assets/data/general_knowledge.json"),
    "Science": Path("assets/data/science.json"),
    "History": Path("assets/data/history.json"),
}

TARGET_PER_DIFFICULTY = 30


QUESTION_BANK = {
    "General Knowledge": {
        "easy": [
            ("What is the capital of Italy?", "Rome", ["Madrid", "Lisbon", "Athens"]),
            ("How many days are in a leap year?", "366", ["365", "364", "367"]),
            ("Which ocean is the largest?", "Pacific Ocean", ["Atlantic Ocean", "Indian Ocean", "Arctic Ocean"]),
            ("Which planet is known as the Red Planet?", "Mars", ["Venus", "Jupiter", "Mercury"]),
            ("What is the largest mammal?", "Blue whale", ["Elephant", "Giraffe", "Hippopotamus"]),
            ("Which country is famous for the Eiffel Tower?", "France", ["Italy", "Germany", "Spain"]),
            ("How many continents are there?", "7", ["5", "6", "8"]),
            ("What is the freezing point of water in Celsius?", "0°C", ["10°C", "32°C", "100°C"]),
            ("Which language is mainly spoken in Brazil?", "Portuguese", ["Spanish", "French", "Italian"]),
            ("What is the smallest prime number?", "2", ["1", "3", "5"]),
            ("Which instrument has black and white keys?", "Piano", ["Violin", "Trumpet", "Flute"]),
            ("What color do red and blue make?", "Purple", ["Green", "Orange", "Brown"]),
            ("How many hours are in one day?", "24", ["12", "18", "36"]),
            ("What is the capital of Japan?", "Tokyo", ["Kyoto", "Osaka", "Nagoya"]),
            ("Which sport uses a racket and a shuttlecock?", "Badminton", ["Baseball", "Football", "Golf"]),
            ("Which shape has three sides?", "Triangle", ["Square", "Circle", "Rectangle"]),
            ("What is the capital of Spain?", "Madrid", ["Barcelona", "Lisbon", "Seville"]),
            ("How many minutes are in one hour?", "60", ["30", "90", "100"]),
            ("Which country is home to the Great Pyramid of Giza?", "Egypt", ["Greece", "Italy", "Turkey"]),
            ("What is the capital of Germany?", "Berlin", ["Munich", "Hamburg", "Vienna"]),
            ("Which season comes after spring?", "Summer", ["Winter", "Autumn", "Spring"]),
            ("Which animal is known for having a long trunk?", "Elephant", ["Lion", "Horse", "Bear"]),
            ("How many sides does a square have?", "4", ["3", "5", "6"]),
            ("Which country is shaped like a boot?", "Italy", ["Portugal", "France", "Belgium"]),
            ("Which currency is used in the United States?", "US Dollar", ["Euro", "Yen", "Pound"]),
            ("Which city is the capital of France?", "Paris", ["Lyon", "Marseille", "Nice"]),
            ("Which day comes after Friday?", "Saturday", ["Thursday", "Sunday", "Monday"]),
            ("How many months are in one year?", "12", ["10", "11", "13"]),
            ("Which animal is famous for black and white stripes?", "Zebra", ["Tiger", "Giraffe", "Panda"]),
            ("Which continent is Brazil in?", "South America", ["North America", "Europe", "Asia"]),
        ],
        "medium": [
            ("Which country uses the yen as its currency?", "Japan", ["China", "South Korea", "Thailand"]),
            ("Who painted the Mona Lisa?", "Leonardo da Vinci", ["Michelangelo", "Raphael", "Donatello"]),
            ("What is the capital of Canada?", "Ottawa", ["Toronto", "Vancouver", "Montreal"]),
            ("Which element has the chemical symbol Au?", "Gold", ["Silver", "Copper", "Iron"]),
            ("Which country contains the city of Istanbul?", "Turkey", ["Greece", "Egypt", "Romania"]),
            ("What is the longest river in South America?", "Amazon River", ["Orinoco", "Paraná", "Magdalena"]),
            ("Who wrote Hamlet?", "William Shakespeare", ["Charles Dickens", "Jane Austen", "Mark Twain"]),
            ("What is the square root of 144?", "12", ["10", "11", "14"]),
            ("Which continent contains the Sahara Desert?", "Africa", ["Asia", "South America", "Australia"]),
            ("Which country gifted the Statue of Liberty to the United States?", "France", ["United Kingdom", "Spain", "Italy"]),
            ("How many players from one team are normally on a soccer field?", "11", ["9", "10", "12"]),
            ("What is the official language of Austria?", "German", ["French", "Italian", "Dutch"]),
            ("Which country is home to Machu Picchu?", "Peru", ["Chile", "Bolivia", "Ecuador"]),
            ("Which blood type is commonly called the universal red-cell donor?", "O negative", ["AB positive", "A positive", "B negative"]),
            ("Which scientist developed the theory of relativity?", "Albert Einstein", ["Isaac Newton", "Nikola Tesla", "Galileo Galilei"]),
            ("What is the capital of Argentina?", "Buenos Aires", ["Santiago", "Lima", "Montevideo"]),
            ("Which country is home to the ancient city of Petra?", "Jordan", ["Lebanon", "Syria", "Iraq"]),
            ("What is the chemical symbol for sodium?", "Na", ["So", "S", "N"]),
            ("Which sea lies between Europe and Africa?", "Mediterranean Sea", ["Black Sea", "Red Sea", "Baltic Sea"]),
            ("What is the capital of Switzerland?", "Bern", ["Zurich", "Geneva", "Basel"]),
            ("Which famous passenger liner sank in 1912?", "Titanic", ["Britannic", "Lusitania", "Bismarck"]),
            ("What is the capital of New Zealand?", "Wellington", ["Auckland", "Christchurch", "Hamilton"]),
            ("Which organ pumps blood through the human body?", "Heart", ["Liver", "Kidney", "Lung"]),
            ("Which continent has the largest number of sovereign states?", "Africa", ["Asia", "Europe", "South America"]),
            ("Which country contains the city of Amsterdam?", "Netherlands", ["Belgium", "Germany", "Denmark"]),
            ("What is the capital of Portugal?", "Lisbon", ["Porto", "Madrid", "Braga"]),
            ("Which author wrote 1984?", "George Orwell", ["Aldous Huxley", "J. R. R. Tolkien", "Ernest Hemingway"]),
            ("What is 15 percent of 200?", "30", ["15", "20", "45"]),
            ("Which country contains the city of Prague?", "Czech Republic", ["Poland", "Austria", "Hungary"]),
            ("Which musical instrument normally has six strings?", "Guitar", ["Flute", "Trumpet", "Clarinet"]),
        ],
        "hard": [
            ("What is the capital of Bhutan?", "Thimphu", ["Paro", "Kathmandu", "Dhaka"]),
            ("Which country contains the ancient city of Samarkand?", "Uzbekistan", ["Kazakhstan", "Turkmenistan", "Tajikistan"]),
            ("Which philosopher wrote The Republic?", "Plato", ["Aristotle", "Socrates", "Epicurus"]),
            ("What is the SI base unit of luminous intensity?", "Candela", ["Lumen", "Lux", "Watt"]),
            ("What is the capital of Kyrgyzstan?", "Bishkek", ["Tashkent", "Dushanbe", "Astana"]),
            ("Which artist painted The Persistence of Memory?", "Salvador Dalí", ["Pablo Picasso", "Joan Miró", "Francisco Goya"]),
            ("Which mountain range is commonly used as part of the boundary between Europe and Asia?", "Ural Mountains", ["Alps", "Andes", "Carpathians"]),
            ("Which treaty imposed peace terms on Germany after World War I?", "Treaty of Versailles", ["Treaty of Utrecht", "Treaty of Paris", "Treaty of Tordesillas"]),
            ("What is the capital of Burkina Faso?", "Ouagadougou", ["Bamako", "Niamey", "Lomé"]),
            ("Which language family does Hungarian belong to?", "Uralic", ["Slavic", "Romance", "Germanic"]),
            ("Which scientist formulated the uncertainty principle?", "Werner Heisenberg", ["Niels Bohr", "Erwin Schrödinger", "Max Planck"]),
            ("Which country contains Timbuktu?", "Mali", ["Niger", "Chad", "Senegal"]),
            ("Who composed The Four Seasons?", "Antonio Vivaldi", ["Johann Sebastian Bach", "Wolfgang Mozart", "George Handel"]),
            ("What is the capital of Suriname?", "Paramaribo", ["Georgetown", "Cayenne", "Belmopan"]),
            ("Which ancient civilization built Chichén Itzá?", "Maya", ["Aztec", "Inca", "Olmec"]),
            ("Which metal has the highest electrical conductivity at room temperature?", "Silver", ["Copper", "Gold", "Aluminum"]),
            ("Which country contains Lake Baikal?", "Russia", ["Mongolia", "China", "Kazakhstan"]),
            ("What is the capital of Eritrea?", "Asmara", ["Addis Ababa", "Khartoum", "Djibouti"]),
            ("Which novel begins with the words 'Call me Ishmael'?", "Moby-Dick", ["Treasure Island", "Robinson Crusoe", "The Odyssey"]),
            ("Which country was historically known as Abyssinia?", "Ethiopia", ["Eritrea", "Sudan", "Somalia"]),
            ("What is the capital of Moldova?", "Chișinău", ["Bucharest", "Sofia", "Minsk"]),
            ("Which element has atomic number 74?", "Tungsten", ["Titanium", "Tantalum", "Thorium"]),
            ("Which empire was ruled by Mansa Musa?", "Mali Empire", ["Songhai Empire", "Ottoman Empire", "Roman Empire"]),
            ("Which country contains Mount Elbrus?", "Russia", ["Georgia", "Turkey", "Armenia"]),
            ("Which mathematician is associated with the incompleteness theorems?", "Kurt Gödel", ["David Hilbert", "Alan Turing", "Georg Cantor"]),
            ("What is the capital of Brunei?", "Bandar Seri Begawan", ["Kuala Lumpur", "Jakarta", "Manila"]),
            ("Which ocean current helps warm Western Europe?", "Gulf Stream", ["Humboldt Current", "Benguela Current", "California Current"]),
            ("Who wrote The Brothers Karamazov?", "Fyodor Dostoevsky", ["Leo Tolstoy", "Anton Chekhov", "Ivan Turgenev"]),
            ("Which country contains the city of Bukhara?", "Uzbekistan", ["Iran", "Afghanistan", "Pakistan"]),
            ("What is the capital of Tajikistan?", "Dushanbe", ["Bishkek", "Ashgabat", "Tashkent"]),
        ],
    },

    "Science": {
        "easy": [
            ("What gas do plants absorb from the atmosphere?", "Carbon dioxide", ["Oxygen", "Hydrogen", "Helium"]),
            ("What is H2O commonly called?", "Water", ["Salt", "Oxygen", "Hydrogen"]),
            ("Which planet is closest to the Sun?", "Mercury", ["Venus", "Earth", "Mars"]),
            ("How many bones are normally in an adult human body?", "206", ["201", "212", "220"]),
            ("What force keeps objects attracted to Earth?", "Gravity", ["Magnetism", "Friction", "Electricity"]),
            ("Which organs are mainly used for breathing?", "Lungs", ["Heart", "Liver", "Kidneys"]),
            ("Which part of a plant mainly absorbs water from soil?", "Roots", ["Leaves", "Flowers", "Fruit"]),
            ("What is the central part of an atom called?", "Nucleus", ["Electron", "Shell", "Orbit"]),
            ("Which blood cells play a major role in fighting infections?", "White blood cells", ["Red blood cells", "Platelets", "Plasma"]),
            ("What is the boiling point of water at sea level in Celsius?", "100°C", ["0°C", "50°C", "212°C"]),
            ("Which star is closest to Earth?", "The Sun", ["Sirius", "Polaris", "Betelgeuse"]),
            ("What is the hardest naturally occurring substance?", "Diamond", ["Gold", "Iron", "Quartz"]),
            ("Which vitamin can the human body produce in the skin after sunlight exposure?", "Vitamin D", ["Vitamin A", "Vitamin C", "Vitamin K"]),
            ("Which part of the body contains the femur?", "Leg", ["Arm", "Skull", "Chest"]),
            ("Which gas makes up most of Earth's atmosphere?", "Nitrogen", ["Oxygen", "Carbon dioxide", "Hydrogen"]),
            ("What is the SI unit of electric current?", "Ampere", ["Volt", "Watt", "Ohm"]),
            ("What is the largest organ of the human body?", "Skin", ["Liver", "Brain", "Lungs"]),
            ("What type of animal is a frog?", "Amphibian", ["Reptile", "Mammal", "Fish"]),
            ("What is the chemical symbol for oxygen?", "O", ["Ox", "Og", "On"]),
            ("Which planet is most famous for its visible rings?", "Saturn", ["Earth", "Mars", "Mercury"]),
            ("What organ pumps blood around the body?", "Heart", ["Liver", "Brain", "Stomach"]),
            ("How many legs does an insect have?", "6", ["4", "8", "10"]),
            ("Which state of matter has a fixed volume but takes the shape of its container?", "Liquid", ["Solid", "Gas", "Plasma"]),
            ("What is frozen water called?", "Ice", ["Steam", "Salt", "Mist"]),
            ("Which sense organ is used for hearing?", "Ear", ["Eye", "Nose", "Tongue"]),
            ("Which planet do humans live on?", "Earth", ["Mars", "Venus", "Jupiter"]),
            ("Which organ allows humans to see?", "Eye", ["Ear", "Heart", "Lung"]),
            ("What do bees collect from flowers?", "Nectar", ["Sand", "Salt", "Stone"]),
            ("Which gas do humans need for normal respiration?", "Oxygen", ["Helium", "Methane", "Neon"]),
            ("Which body part protects the brain?", "Skull", ["Rib", "Femur", "Pelvis"]),
        ],
        "medium": [
            ("What is the chemical symbol for potassium?", "K", ["P", "Po", "Pt"]),
            ("Which organ produces insulin?", "Pancreas", ["Liver", "Kidney", "Stomach"]),
            ("What type of energy is stored in food?", "Chemical energy", ["Kinetic energy", "Sound energy", "Light energy"]),
            ("What is the approximate pH of pure water at room temperature?", "7", ["5", "6", "9"]),
            ("Which subatomic particle has a negative electric charge?", "Electron", ["Proton", "Neutron", "Photon"]),
            ("Which major layer of Earth is liquid?", "Outer core", ["Inner core", "Crust", "Lower mantle"]),
            ("Which organelle is often called the powerhouse of the cell?", "Mitochondrion", ["Nucleus", "Ribosome", "Golgi apparatus"]),
            ("Which law relates voltage, current and resistance?", "Ohm's law", ["Newton's law", "Boyle's law", "Hooke's law"]),
            ("Which gas is consumed during aerobic cellular respiration?", "Oxygen", ["Nitrogen", "Helium", "Methane"]),
            ("What is the speed of light in vacuum approximately?", "300,000 km/s", ["150,000 km/s", "30,000 km/s", "3,000 km/s"]),
            ("Which field of biology studies heredity?", "Genetics", ["Ecology", "Geology", "Astronomy"]),
            ("What is the main component of natural gas?", "Methane", ["Ethane", "Propane", "Butane"]),
            ("Which blood vessels carry blood away from the heart?", "Arteries", ["Veins", "Capillaries", "Lymph vessels"]),
            ("What is the SI unit of force?", "Newton", ["Joule", "Pascal", "Watt"]),
            ("Which scientist is strongly associated with the theory of natural selection?", "Charles Darwin", ["Gregor Mendel", "Louis Pasteur", "James Watson"]),
            ("What is the main function of red blood cells?", "Transport oxygen", ["Produce insulin", "Digest food", "Produce antibodies"]),
            ("Which electromagnetic radiation has the shortest wavelength?", "Gamma rays", ["X-rays", "Ultraviolet", "Microwaves"]),
            ("What is the chemical formula of sodium chloride?", "NaCl", ["KCl", "CaCO3", "NaOH"]),
            ("Which part of the brain is strongly involved in balance and coordination?", "Cerebellum", ["Cerebrum", "Medulla", "Hypothalamus"]),
            ("What is the loss of water vapor from plant leaves called?", "Transpiration", ["Respiration", "Photosynthesis", "Germination"]),
            ("What is the SI unit of frequency?", "Hertz", ["Newton", "Pascal", "Tesla"]),
            ("Which element is present at the center of hemoglobin's heme group?", "Iron", ["Calcium", "Magnesium", "Sodium"]),
            ("Which planet has the shortest orbital period around the Sun?", "Mercury", ["Venus", "Mars", "Earth"]),
            ("Who discovered penicillin?", "Alexander Fleming", ["Louis Pasteur", "Robert Koch", "Joseph Lister"]),
            ("Which type of chemical bond involves sharing electron pairs?", "Covalent bond", ["Ionic bond", "Metallic bond", "Hydrogen bond"]),
            ("Which tissue connects muscle to bone?", "Tendon", ["Ligament", "Cartilage", "Epithelium"]),
            ("Which unit measures electrical resistance?", "Ohm", ["Volt", "Ampere", "Watt"]),
            ("Which molecule stores hereditary information in most living organisms?", "DNA", ["ATP", "Glucose", "Protein"]),
            ("What type of rock forms when magma or lava cools?", "Igneous", ["Sedimentary", "Metamorphic", "Organic"]),
            ("Which process allows green plants to convert light energy into chemical energy?", "Photosynthesis", ["Respiration", "Fermentation", "Digestion"]),
        ],
        "hard": [
            ("Which particle carries the electromagnetic force in quantum field theory?", "Photon", ["Gluon", "Neutrino", "Muon"]),
            ("What is Avogadro's constant approximately?", "6.022 × 10^23", ["9.81 × 10^2", "3.00 × 10^8", "1.602 × 10^-19"]),
            ("Which thermodynamic law states that the entropy of an isolated system cannot spontaneously decrease?", "Second law of thermodynamics", ["First law of thermodynamics", "Zeroth law of thermodynamics", "Boyle's law"]),
            ("What is the approximate value of the gravitational constant G?", "6.67 × 10^-11 N·m²/kg²", ["9.81 N/kg", "3.00 × 10^8 m/s", "1.38 × 10^-23 J/K"]),
            ("Which organelle modifies, sorts and packages many proteins?", "Golgi apparatus", ["Lysosome", "Nucleus", "Centrosome"]),
            ("What is the boundary beyond which events cannot affect an outside observer around a black hole?", "Event horizon", ["Photon sphere", "Accretion disk", "Magnetosphere"]),
            ("Which quantum number describes the intrinsic angular momentum orientation of an electron?", "Spin quantum number", ["Principal quantum number", "Magnetic quantum number", "Azimuthal quantum number"]),
            ("What is the SI unit of magnetic flux density?", "Tesla", ["Weber", "Henry", "Gauss"]),
            ("Which enzyme separates the two DNA strands during replication?", "Helicase", ["Ligase", "Amylase", "Pepsin"]),
            ("Which subatomic particle has approximately zero electric charge?", "Neutron", ["Proton", "Electron", "Positron"]),
            ("What is the normal human arterial blood pH approximately?", "7.4", ["6.0", "8.5", "5.5"]),
            ("Which law relates pressure and volume for a fixed amount of gas at constant temperature?", "Boyle's law", ["Charles's law", "Faraday's law", "Hooke's law"]),
            ("Which process generates most ATP during aerobic respiration through the electron transport chain?", "Oxidative phosphorylation", ["Glycolysis", "Fermentation", "Transcription"]),
            ("Which stellar spectral class has the highest surface temperature?", "O-type", ["G-type", "K-type", "M-type"]),
            ("Which fundamental force binds quarks together?", "Strong nuclear force", ["Weak nuclear force", "Electromagnetic force", "Gravity"]),
            ("What defines the primary structure of a protein?", "Its amino acid sequence", ["Its alpha helices", "Its overall 3D shape", "Its subunit arrangement"]),
            ("Which physicist developed the wave equation bearing his name in quantum mechanics?", "Erwin Schrödinger", ["Niels Bohr", "Max Born", "Werner Heisenberg"]),
            ("Which part of the nephron is responsible for most filtered solute and water reabsorption?", "Proximal convoluted tubule", ["Collecting duct", "Bowman's capsule", "Distal convoluted tubule"]),
            ("Which molecule is often described as the primary energy currency of cells?", "ATP", ["DNA", "RNA", "Glucose"]),
            ("Which radioactive isotope is commonly used for dating once-living archaeological material?", "Carbon-14", ["Carbon-12", "Carbon-13", "Carbon-11"]),
            ("What is the SI derived unit of pressure?", "Pascal", ["Newton", "Joule", "Bar"]),
            ("Which type of RNA carries amino acids to a ribosome?", "tRNA", ["mRNA", "rRNA", "miRNA"]),
            ("What is Earth's escape velocity at the surface approximately?", "11.2 km/s", ["7.9 km/s", "3.2 km/s", "24.5 km/s"]),
            ("Which law describes electromagnetic induction?", "Faraday's law", ["Coulomb's law", "Hooke's law", "Snell's law"]),
            ("Which cells can differentiate into plasma cells that secrete antibodies?", "B lymphocytes", ["Red blood cells", "Platelets", "Neurons"]),
            ("Which process converts pyruvate into acetyl-CoA before the citric acid cycle?", "Pyruvate oxidation", ["Glycolysis", "Fermentation", "Translation"]),
            ("Which element has the highest electronegativity on the Pauling scale?", "Fluorine", ["Oxygen", "Chlorine", "Nitrogen"]),
            ("What is programmed cell death called?", "Apoptosis", ["Necrosis", "Mitosis", "Meiosis"]),
            ("Which set of equations describes classical electromagnetism?", "Maxwell's equations", ["Navier-Stokes equations", "Einstein field equations", "Euler equations"]),
            ("Which enzyme synthesizes RNA using DNA as a template?", "RNA polymerase", ["DNA ligase", "Helicase", "Amylase"]),
        ],
    },

    "History": {
        "easy": [
            ("Who was the first president of the United States?", "George Washington", ["Abraham Lincoln", "Thomas Jefferson", "John Adams"]),
            ("Which ancient civilization built the pyramids of Giza?", "Ancient Egyptians", ["Romans", "Greeks", "Persians"]),
            ("In which country did the Renaissance begin?", "Italy", ["France", "Spain", "England"]),
            ("Which explorer reached the Americas in 1492 while sailing for Spain?", "Christopher Columbus", ["Ferdinand Magellan", "James Cook", "Marco Polo"]),
            ("Which ancient empire was famous for gladiatorial contests in the Colosseum?", "Roman Empire", ["Ottoman Empire", "Mongol Empire", "Aztec Empire"]),
            ("Which war was fought between the Union and Confederacy in the United States?", "American Civil War", ["World War I", "Crimean War", "Seven Years' War"]),
            ("Who was known as the Maid of Orléans?", "Joan of Arc", ["Marie Antoinette", "Cleopatra", "Catherine the Great"]),
            ("Which ancient civilization developed democracy in Athens?", "Ancient Greeks", ["Romans", "Vikings", "Persians"]),
            ("Which Egyptian queen was allied with Julius Caesar and Mark Antony?", "Cleopatra VII", ["Nefertiti", "Hatshepsut", "Boudica"]),
            ("Which wall divided East and West Berlin until 1989?", "Berlin Wall", ["Hadrian's Wall", "Great Wall of China", "Antonine Wall"]),
            ("Who led Nazi Germany during World War II?", "Adolf Hitler", ["Benito Mussolini", "Joseph Stalin", "Winston Churchill"]),
            ("Which ancient civilization used hieroglyphs extensively?", "Ancient Egyptians", ["Vikings", "Romans", "Celts"]),
            ("Which ship carried the Pilgrims to North America in 1620?", "Mayflower", ["Santa Maria", "Endeavour", "Victory"]),
            ("Who was the first person to walk on the Moon?", "Neil Armstrong", ["Buzz Aldrin", "Yuri Gagarin", "John Glenn"]),
            ("Which Roman city was buried by Mount Vesuvius in AD 79?", "Pompeii", ["Rome", "Athens", "Sparta"]),
            ("Whose assassination in Sarajevo in 1914 helped trigger World War I?", "Archduke Franz Ferdinand", ["Kaiser Wilhelm II", "Tsar Nicholas II", "Otto von Bismarck"]),
            ("Which empire had Constantinople as its capital for centuries?", "Byzantine Empire", ["Mughal Empire", "Aztec Empire", "Mali Empire"]),
            ("Which civilization originated the ancient Olympic Games?", "Ancient Greeks", ["Romans", "Egyptians", "Persians"]),
            ("Who is conventionally considered the first Roman emperor?", "Augustus", ["Julius Caesar", "Nero", "Trajan"]),
            ("Which country is historically associated with samurai?", "Japan", ["China", "Korea", "Mongolia"]),
            ("Who drafted the principal text of the U.S. Declaration of Independence?", "Thomas Jefferson", ["George Washington", "Benjamin Franklin", "John Adams"]),
            ("Which empire was founded by Genghis Khan?", "Mongol Empire", ["Ottoman Empire", "Roman Empire", "Persian Empire"]),
            ("Which English queen reigned during the Spanish Armada of 1588?", "Elizabeth I", ["Victoria", "Mary I", "Anne"]),
            ("Napoleon Bonaparte became emperor of which country?", "France", ["Italy", "Spain", "Austria"]),
            ("Which global war ended in 1945?", "World War II", ["World War I", "Korean War", "Vietnam War"]),
            ("Which empire built Machu Picchu?", "Inca Empire", ["Aztec Empire", "Roman Empire", "Ottoman Empire"]),
            ("Which city was the traditional center of the Roman Empire?", "Rome", ["Athens", "Carthage", "Alexandria"]),
            ("Who led the Soviet Union during most of World War II?", "Joseph Stalin", ["Vladimir Lenin", "Nikita Khrushchev", "Mikhail Gorbachev"]),
            ("Which ancient civilization built the Parthenon?", "Ancient Greeks", ["Romans", "Egyptians", "Phoenicians"]),
            ("Which European country controlled the thirteen colonies before American independence?", "Great Britain", ["France", "Spain", "Portugal"]),
        ],
        "medium": [
            ("Which treaty imposed peace terms on Germany after World War I?", "Treaty of Versailles", ["Treaty of Paris", "Treaty of Utrecht", "Treaty of Vienna"]),
            ("Who was British prime minister during most of World War II?", "Winston Churchill", ["Neville Chamberlain", "Clement Attlee", "Anthony Eden"]),
            ("Which empire captured Constantinople in 1453?", "Ottoman Empire", ["Mongol Empire", "Persian Empire", "Holy Roman Empire"]),
            ("Which revolution began in France in 1789?", "French Revolution", ["Glorious Revolution", "Industrial Revolution", "Russian Revolution"]),
            ("Who led the Bolsheviks during the October Revolution?", "Vladimir Lenin", ["Joseph Stalin", "Nicholas II", "Alexander Kerensky"]),
            ("Which civilization built Tenochtitlan?", "Aztec", ["Inca", "Maya", "Olmec"]),
            ("Which ruler was known as the Sun King?", "Louis XIV", ["Louis XVI", "Napoleon I", "Charles V"]),
            ("Which battle ended Napoleon's Hundred Days in 1815?", "Battle of Waterloo", ["Battle of Trafalgar", "Battle of Austerlitz", "Battle of Borodino"]),
            ("Which empire was ruled by Suleiman the Magnificent?", "Ottoman Empire", ["Mughal Empire", "Byzantine Empire", "Roman Empire"]),
            ("Who became internationally known for leading nonviolent resistance against British rule in India?", "Mahatma Gandhi", ["Jawaharlal Nehru", "Muhammad Ali Jinnah", "Indira Gandhi"]),
            ("Which Chinese dynasty built much of the surviving Great Wall?", "Ming dynasty", ["Han dynasty", "Qin dynasty", "Tang dynasty"]),
            ("Which event immediately triggered Austria-Hungary's crisis with Serbia in 1914?", "Assassination of Archduke Franz Ferdinand", ["Sinking of Lusitania", "Invasion of Poland", "Russian Revolution"]),
            ("Which English king sealed the Magna Carta in 1215?", "King John", ["Henry VIII", "Richard III", "Edward III"]),
            ("Who was the first Tudor monarch of England?", "Henry VII", ["Henry VIII", "Edward VI", "Richard III"]),
            ("Which empire was ruled by Akbar the Great?", "Mughal Empire", ["Ottoman Empire", "Safavid Empire", "Roman Empire"]),
            ("Which conflict lasted from 1950 to 1953?", "Korean War", ["Vietnam War", "Gulf War", "Crimean War"]),
            ("Which Roman emperor legalized Christianity through the Edict of Milan with Licinius?", "Constantine I", ["Nero", "Caligula", "Trajan"]),
            ("What was the capital of the Byzantine Empire?", "Constantinople", ["Rome", "Athens", "Antioch"]),
            ("Which treaty divided overseas spheres between Spain and Portugal in 1494?", "Treaty of Tordesillas", ["Treaty of Versailles", "Treaty of Utrecht", "Treaty of Paris"]),
            ("Which empire controlled large parts of the Indian subcontinent before the rise of British dominance?", "Mughal Empire", ["Ottoman Empire", "Roman Empire", "Mali Empire"]),
            ("Which country launched Sputnik 1?", "Soviet Union", ["United States", "Germany", "China"]),
            ("Who was the Carthaginian commander famous for crossing the Alps?", "Hannibal Barca", ["Scipio Africanus", "Julius Caesar", "Pompey"]),
            ("Which peace agreements ended the Thirty Years' War in 1648?", "Peace of Westphalia", ["Congress of Vienna", "Treaty of Utrecht", "Treaty of Paris"]),
            ("Which West African empire is strongly associated with Mansa Musa and Timbuktu?", "Mali Empire", ["Zulu Kingdom", "Aksumite Empire", "Benin Empire"]),
            ("Which French king was executed in 1793 during the French Revolution?", "Louis XVI", ["Louis XIV", "Louis XV", "Charles X"]),
            ("Which state was unified under the leadership of Otto von Bismarck?", "Germany", ["Italy", "Austria", "Belgium"]),
            ("Which European country colonized Brazil?", "Portugal", ["Spain", "France", "Netherlands"]),
            ("Which queen was the daughter of Henry VIII and Anne Boleyn?", "Elizabeth I", ["Mary I", "Victoria", "Anne"]),
            ("Which empire was centered on the city of Tenochtitlan?", "Aztec Empire", ["Inca Empire", "Mali Empire", "Mughal Empire"]),
            ("Which event began on July 14, 1789 in Paris and became a symbol of the French Revolution?", "Storming of the Bastille", ["Battle of Waterloo", "Reign of Terror", "Congress of Vienna"]),
        ],
        "hard": [
            ("Which Byzantine emperor ordered the compilation known as the Corpus Juris Civilis?", "Justinian I", ["Constantine XI", "Basil II", "Heraclius"]),
            ("Which battle in 732 is associated with Charles Martel's victory over an Umayyad army?", "Battle of Tours", ["Battle of Hastings", "Battle of Lepanto", "Battle of Agincourt"]),
            ("Which Chinese dynasty ruled during the voyages of Zheng He?", "Ming dynasty", ["Qing dynasty", "Tang dynasty", "Song dynasty"]),
            ("Which treaty ended the War of the Spanish Succession for several major powers in 1713?", "Treaty of Utrecht", ["Treaty of Vienna", "Treaty of Paris", "Treaty of Tordesillas"]),
            ("Who is traditionally identified as the last emperor of the Western Roman Empire?", "Romulus Augustulus", ["Honorius", "Majorian", "Constantine XI"]),
            ("Who founded the Maurya Empire?", "Chandragupta Maurya", ["Ashoka", "Bindusara", "Harsha"]),
            ("Which caliph founded Baghdad in the eighth century?", "Al-Mansur", ["Harun al-Rashid", "Al-Ma'mun", "Muawiya I"]),
            ("Which power fought Rome in the Punic Wars?", "Carthage", ["Parthia", "Macedon", "Egypt"]),
            ("Which treaty ended the Great Northern War in 1721?", "Treaty of Nystad", ["Treaty of Brest-Litovsk", "Treaty of Tilsit", "Treaty of San Stefano"]),
            ("Which Chinese civil conflict was led by Hong Xiuquan?", "Taiping Rebellion", ["Boxer Rebellion", "Yellow Turban Rebellion", "Xinhai Revolution"]),
            ("Which dynasty ruled Safavid Iran?", "Safavid dynasty", ["Timurid dynasty", "Qajar dynasty", "Umayyad dynasty"]),
            ("Which battle in 1066 established William the Conqueror's rule in England?", "Battle of Hastings", ["Battle of Bosworth", "Battle of Bannockburn", "Battle of Agincourt"]),
            ("Which Macedonian ruler conquered the Achaemenid Persian Empire?", "Alexander the Great", ["Philip II", "Pericles", "Pyrrhus"]),
            ("Which treaty divided Charlemagne's empire among his grandsons in 843?", "Treaty of Verdun", ["Treaty of Utrecht", "Treaty of Tordesillas", "Treaty of Troyes"]),
            ("Which city was captured by the Fourth Crusade in 1204?", "Constantinople", ["Jerusalem", "Rome", "Alexandria"]),
            ("Which French monarch issued the Edict of Nantes?", "Henry IV", ["Louis XIII", "Francis I", "Charles IX"]),
            ("Which dynasty defeated the Southern Song and unified China in 1279?", "Yuan dynasty", ["Ming dynasty", "Qing dynasty", "Han dynasty"]),
            ("Which Persian ruler commissioned the Behistun Inscription?", "Darius I", ["Cyrus the Great", "Xerxes I", "Artaxerxes I"]),
            ("Which major European conflict began after the Defenestration of Prague in 1618?", "Thirty Years' War", ["Seven Years' War", "Crimean War", "Hundred Years' War"]),
            ("Who founded the Sasanian Empire?", "Ardashir I", ["Shapur I", "Khosrow I", "Darius III"]),
            ("Which treaty ended the Russo-Japanese War in 1905?", "Treaty of Portsmouth", ["Treaty of Shimonoseki", "Treaty of Nanking", "Treaty of San Stefano"]),
            ("Which African empire defeated Italy at the Battle of Adwa in 1896?", "Ethiopian Empire", ["Ottoman Empire", "Mali Empire", "Songhai Empire"]),
            ("Which Mongol ruler founded the Yuan dynasty?", "Kublai Khan", ["Genghis Khan", "Ögedei Khan", "Möngke Khan"]),
            ("Which Roman emperor established the Tetrarchy?", "Diocletian", ["Constantine I", "Theodosius I", "Augustus"]),
            ("Which Greek alliance was led primarily by Sparta?", "Peloponnesian League", ["Delian League", "Achaean League", "Boeotian League"]),
            ("Which Persian king led the invasion of Greece in 480 BCE?", "Xerxes I", ["Darius III", "Cyrus the Great", "Cambyses II"]),
            ("Which French king revoked the Edict of Nantes in 1685?", "Louis XIV", ["Louis XIII", "Louis XV", "Henry IV"]),
            ("Which Ottoman sultan captured Constantinople in 1453?", "Mehmed II", ["Suleiman I", "Selim I", "Bayezid I"]),
            ("Which battle in 1071 was a major Byzantine defeat against the Seljuk Turks?", "Battle of Manzikert", ["Battle of Lepanto", "Battle of Nicopolis", "Battle of Varna"]),
            ("Which Roman emperor was ruling when Mount Vesuvius erupted in AD 79?", "Titus", ["Nero", "Augustus", "Hadrian"]),
        ],
    },
}


def normalize(text):
    return " ".join(text.strip().lower().split())


def create_question(category, difficulty, values):
    question, correct, incorrect = values

    return {
        "type": "multiple",
        "difficulty": difficulty,
        "category": category,
        "question": question,
        "correct_answer": correct,
        "incorrect_answers": incorrect,
    }


for category, file_path in FILES.items():
    with file_path.open("r", encoding="utf-8") as file:
        data = json.load(file)

    questions = data.get("results", [])

    existing_texts = {
        normalize(question.get("question", ""))
        for question in questions
    }

    for difficulty in ("easy", "medium", "hard"):
        current_count = sum(
            1
            for question in questions
            if question.get("difficulty", "").lower() == difficulty
        )

        needed = TARGET_PER_DIFFICULTY - current_count

        if needed <= 0:
            continue

        available = [
            item
            for item in QUESTION_BANK[category][difficulty]
            if normalize(item[0]) not in existing_texts
        ]

        if len(available) < needed:
            raise RuntimeError(
                f"Not enough unique questions for "
                f"{category} / {difficulty}. "
                f"Need {needed}, available {len(available)}."
            )

        for item in available[:needed]:
            new_question = create_question(
                category,
                difficulty,
                item,
            )

            questions.append(new_question)
            existing_texts.add(
                normalize(new_question["question"])
            )

    data["response_code"] = 0
    data["results"] = questions

    with file_path.open("w", encoding="utf-8") as file:
        json.dump(
            data,
            file,
            indent=2,
            ensure_ascii=False,
        )

    counts = Counter(
        question.get("difficulty", "unknown").lower()
        for question in questions
    )

    print()
    print(category)
    print("Total:", len(questions))
    print("Easy:", counts["easy"])
    print("Medium:", counts["medium"])
    print("Hard:", counts["hard"])


print()
print("JSON files updated successfully.")