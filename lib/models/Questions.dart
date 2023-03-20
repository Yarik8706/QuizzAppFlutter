class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Which band was John Lennon a member of in the 1960s?",
    "options": ['John & Paul', 'Brothers Four', 'The Beatles', 'Nirvana'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": "What is the English national flower?",
    "options": ['Rose', 'Daisy', 'Daffodil', 'Gerbera'],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "The British Prime Minister stays at:",
    "options": ['12 The Mall', '10 Downing St', '11 Whitehall'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "The lake lying in the Highlandsof Scotland is called:",
    "options": ['Loch Lomond', 'Eibsee', 'Loch Ness', 'Baikal'],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question": "What is not a part of the United Kingdom ?",
    "options": ['Ireland', 'Wales', 'Scotland'],
    "answer_index": 0,
  },
  {
    "id": 6,
    "question": "Who was the first woman Prime Minister of the United Kingdom?",
    "options": ['Agatha Christie', 'Margaret Thatcher', 'Golda Mier'],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "What is Harrods?",
    "options": ['History Museum', 'Department Store', '5 -Star Hotel'],
    "answer_index": 1,
  },
  {
    "id": 8,
    "question": "What is the national animal of England?",
    "options": ['Dogs', 'Cats', 'Coals', 'Lions'],
    "answer_index": 3,
  },
  {
    "id": 9,
    "question": "Which famous writer was born in Stratford-upon-Avon?",
    "options": ['Charles Dickens', 'Mark Twain', 'William Shakespeare'],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "The currency of Great Britain is…",
    "options": ['Euro', 'Pound sterling', 'Dollar'],
    "answer_index": 1,
  },
  {
    "id": 11,
    "question": "The Great Fire of London took place in…",
    "options": ['1666', '1330', '1550'],
    "answer_index": 0,
  },
  {
    "id": 12,
    "question": "The second day of Christmas is called…",
    "options": ['Pancake Day', 'Black Friday', 'Boxing Day'],
    "answer_index": 2,
  },
  {
    "id": 13,
    "question": "The Royal family lives at...",
    "options": ['Tower of London', 'Buckingham Palace', '221B, Baker Street'],
    "answer_index": 1,
  },
  {
    "id": 14,
    "question": "Who crowns the monarch of the United Kingdom?",
    "options": [
      'Prime Minister',
      'Lord Chamberlain',
      'Archbishop of Canterbury'
    ],
    "answer_index": 2,
  },
  {
    "id": 15,
    "question": "What is traditional food in the UK?",
    "options": ['Burgers & Nachos', 'Fish&Chips', 'Ratatouille'],
    "answer_index": 1,
  },
  {
    "id": 16,
    "question": "When did England win the Football World Cup?",
    "options": ['1950', '1966', '1982'],
    "answer_index": 1,
  },
  {
    "id": 17,
    "question": "What is the surname of the Queen Elizabeth II?",
    "options": ['Tudor', 'Williams', 'Windsor'],
    "answer_index": 2,
  },
  {
    "id": 18,
    "question": "What city was the capital of England before London?",
    "options": ['Liverpool', 'Winchester', 'Manchester'],
    "answer_index": 1,
  },
  {
    "id": 19,
    "question": "When is England's national day?",
    "options": ['23 April', '1 January', '20 October'],
    "answer_index": 0,
  },
  {
    "id": 20,
    "question": "What is the name of the flag of the United Kingdom?",
    "options": ['The Maple Leaf', 'Stars and Stripes', 'The Union Jack'],
    "answer_index": 2,
  },
];
