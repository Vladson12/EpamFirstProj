CREATE SCHEMA IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8 ;
USE `library` ;


SET FOREIGN_KEY_CHECKS=0;


CREATE TABLE IF NOT EXISTS `library`.`book_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_state_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

insert into `library`.`book_state` (id, book_state_name) values (1,'FREE');
insert into `library`.`book_state` (id, book_state_name) values (2,'ORDERED');
insert into `library`.`book_state` (id, book_state_name) values (3,'ON_HANDS');




CREATE TABLE `library`.`genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

insert into `library`.`genre` (id, genre_name) values (1,'TEXTBOOK');
insert into `library`.`genre` (id, genre_name) values (2,'NARRATIVE_NONFICTION');
insert into `library`.`genre` (id, genre_name) values (3,'DRAMA');
insert into `library`.`genre` (id, genre_name) values (4,'FANTASY');
insert into `library`.`genre` (id, genre_name) values (5,'CRIME_AND_DETECTIVE');
insert into `library`.`genre` (id, genre_name) values (6,'SELF_HELP_BOOK');
insert into `library`.`genre` (id, genre_name) values (7,'SCIENCE_FICTION');




CREATE TABLE `library`.`book` (
  `idbook` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `year` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `book_state_id` int(11) NOT NULL DEFAULT '1',
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`idbook`),
  KEY `book_state_idx` (`book_state_id`),
  KEY `genre_idx` (`genre`),
  CONSTRAINT `book_state` FOREIGN KEY (`book_state_id`) REFERENCES `book_state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `genre` FOREIGN KEY (`genre`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1678, 4, 'The Pilgrim’s Progress', 'A story of a man in search of truth told with the simple clarity and beauty of Bunyan’s prose make this the ultimate English classic.', 'John Bunyan');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1719, 5, 'Robinson Crusoe', 'By the end of the 19th century, no book in English literary history had enjoyed more editions, spin-offs and translations. Crusoe’s world-famous novel is a complex literary confection, and it’s irresistible.', 'Daniel Defoe');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1726, 4, 'Gulliver’s Travels', 'A satirical masterpiece that’s never been out of print, Jonathan Swift’s Gulliver’s Travels comes third in our list of the best novels written in English', 'Jonathan Swift');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1748, 5, 'Clarissa', 'Clarissa is a tragic heroine, pressured by her unscrupulous nouveau-riche family to marry a wealthy man she detests, in the book that Samuel Johnson described as “the first book in the world for the knowledge it displays of the human heart.”', 'Samuel Richardson');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1749, 4, 'Tom Jones', 'Tom Jones is a classic English novel that captures the spirit of its age and whose famous characters have come to represent Augustan society in all its loquacious, turbulent, comic variety.', 'Henry Fielding');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1759, 3, 'The Life and Opinions of Tristram Shandy, Gentleman', 'Laurence Sterne’s vivid novel caused delight and consternation when it first appeared and has lost little of its original bite.', 'Laurence Sterne');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1816, 3, 'Emma', 'Jane Austen’s Emma is her masterpiece, mixing the sparkle of her early books with a deep sensibility.', 'Jane Austen');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1818, 4, 'Frankenstein', 'Mary Shelley’s first novel has been hailed as a masterpiece of horror and the macabre.', 'Mary Shelley');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1818, 5, 'Nightmare Abbey', 'The great pleasure of Nightmare Abbey, which was inspired by Thomas Love Peacock’s friendship with Shelley, lies in the delight the author takes in poking fun at the romantic movement.', 'Thomas Love Peacock');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1838, 4, 'The Narrative', 'Edgar Allan Poe’s only novel – a classic adventure story with supernatural elements – has fascinated and influenced generations of writers.', 'Edgar Allan Poe');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1845, 5, 'Sybil', 'The future prime minister displayed flashes of brilliance that equalled the greatest Victorian novelists.', 'Benjamin Disraeli');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1847, 4, 'Jane Eyre', 'Charlotte Brontë’s erotic, gothic masterpiece became the sensation of Victorian England. Its great breakthrough was its intimate dialogue with the reader.', 'Charlotte Brontë');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1847, 4, 'Wuthering Heights', 'Emily Brontë’s windswept masterpiece is notable not just for its wild beauty but for its daring reinvention of the novel form itself.', 'Emily Brontë');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1848, 4, 'Vanity Fair', 'William Thackeray’s masterpiece, set in Regency England, is a bravura performance by a writer at the top of his game.', 'William Thackeray');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1850, 5, 'David Copperfield', 'David Copperfield marked the point at which Dickens became the great entertainer and also laid the foundations for his later, darker masterpieces.', 'Charles Dickens');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1650, 3, 'The Scarlet Letter', 'Nathaniel Hawthorne’s astounding book is full of intense symbolism and as haunting as anything by Edgar Allan Poe.', 'Nathaniel Hawthorne');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1678, 4, 'The Pilgrim’s Progress', 'A story of a man in search of truth told with the simple clarity and beauty of Bunyan’s prose make this the ultimate English classic.', 'John Bunyan');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1719, 5, 'Robinson Crusoe', 'By the end of the 19th century, no book in English literary history had enjoyed more editions, spin-offs and translations. Crusoe’s world-famous novel is a complex literary confection, and it’s irresistible.', 'Daniel Defoe');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1726, 4, 'Gulliver’s Travels', 'A satirical masterpiece that’s never been out of print, Jonathan Swift’s Gulliver’s Travels comes third in our list of the best novels written in English', 'Jonathan Swift');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1748, 5, 'Clarissa', 'Clarissa is a tragic heroine, pressured by her unscrupulous nouveau-riche family to marry a wealthy man she detests, in the book that Samuel Johnson described as “the first book in the world for the knowledge it displays of the human heart.”', 'Samuel Richardson');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1749, 4, 'Tom Jones', 'Tom Jones is a classic English novel that captures the spirit of its age and whose famous characters have come to represent Augustan society in all its loquacious, turbulent, comic variety.', 'Henry Fielding');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1759, 3, 'The Life and Opinions of Tristram Shandy, Gentleman', 'Laurence Sterne’s vivid novel caused delight and consternation when it first appeared and has lost little of its original bite.', 'Laurence Sterne');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1816, 3, 'Emma', 'Jane Austen’s Emma is her masterpiece, mixing the sparkle of her early books with a deep sensibility.', 'Jane Austen');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1818, 4, 'Frankenstein', 'Mary Shelley’s first novel has been hailed as a masterpiece of horror and the macabre.', 'Mary Shelley');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1818, 5, 'Nightmare Abbey', 'The great pleasure of Nightmare Abbey, which was inspired by Thomas Love Peacock’s friendship with Shelley, lies in the delight the author takes in poking fun at the romantic movement.', 'Thomas Love Peacock');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1838, 4, 'The Narrative', 'Edgar Allan Poe’s only novel – a classic adventure story with supernatural elements – has fascinated and influenced generations of writers.', 'Edgar Allan Poe');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1845, 5, 'Sybil', 'The future prime minister displayed flashes of brilliance that equalled the greatest Victorian novelists.', 'Benjamin Disraeli');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1847, 4, 'Jane Eyre', 'Charlotte Brontë’s erotic, gothic masterpiece became the sensation of Victorian England. Its great breakthrough was its intimate dialogue with the reader.', 'Charlotte Brontë');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1847, 4, 'Wuthering Heights', 'Emily Brontë’s windswept masterpiece is notable not just for its wild beauty but for its daring reinvention of the novel form itself.', 'Emily Bront');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1848, 4, 'Vanity Fair', 'William Thackeray’s masterpiece, set in Regency England, is a bravura performance by a writer at the top of his game.', 'William Thackeray');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1850, 5, 'David Copperfield', 'David Copperfield marked the point at which Dickens became the great entertainer and also laid the foundations for his later, darker masterpieces.', 'Charles Dickens');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1650, 3, 'The Scarlet Letter', 'Nathaniel Hawthorne’s astounding book is full of intense symbolism and as haunting as anything by Edgar Allan Poe.', 'Nathaniel Hawthorne');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1987, 4, 'The sea hunters', 'A steamboat goes up in flames...and down to the bottom of the sea. A locomotive plunges into a creek...and vanishes into mystery. A German U-boat sends an American troop transport, and eight hundred on board, to a watery grave...on Christmas Eve.', 'Clive Cussler');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (2000, 5, 'Atlantis found', 'An Antarctic whaler stumbles across an aged wreck—her frozen crew guarding a priceless treasure. A team of anthropologists is buried under a mountain by a deliberate explosion.', 'Clive Cussler');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1726, 4, 'The wrecker', 'In The Chase, Clive Cussler introduced an electrifying new hero, the tall, lean, no-nonsense detective Isaac Bell, who, driven by his sense of justice, travels early-twentieth-century America pursuing thieves and killers . . . and sometimes criminals much worse.', 'Justin Scott');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1994, 5, 'Debt of Honor', 'It begins with the murder of an American woman in the back streets of Tokyo. It ends in war Number-one bestselling author Tom Clancy takes a bold, incisive look at what our nation''s leaders are calling "the new world order." ', 'Tom Clancyn');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1985, 4, 'Deep Six', 'A deadly tide of poison flows into ocean waters. A ghost ship drifts across the empty northern Pacific. A luxury Soviet liner blazes into a funeral pyre. The Presidential yacht cruises the Potomac night—and the President disappears without a trace.', 'Clive Cussler');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1997, 3, 'Tom Clancy''s op-center', 'Laurence Sterne’s vivid novel caused delight and consternation when it first appeared and has lost little of its original bite. A ghost ship drifts across the empty northern Pacific.', 'LTom Clancy');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1979, 1, 'The atmosphere', 'Jane Austen’s Emma is her masterpiece, mixing the sparkle of her early books with a deep sensibility. A ghost ship drifts across the empty northern Pacific.', 'Frederick K. Lutgens');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1994, 1, 'Intermediate algebra', 'Mary Shelley’s first novel has been hailed as a masterpiece of horror and the macabre.', 'Ron Larson');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1998, 5, 'Honeymoon For Three', 'Cory wanted a babyno strings attached! Her ex-husband had done more than enough to convince her that men were surplus requirements. Apart from one basic detailShe needed a lover. ', 'Sandra Field');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (2001, 3, 'Rhys''s Redemption', 'Rhys''s rule: Don''t get involved! Rhys Wolfe''s demanding job left no time for romance--which was fine with him. He was close friends with his gorgeous neighbor, Mariah. But that was all they were--friends. Their one night of passion had been a mistake...', 'Anne McAllisterd');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1998, 2, 'Water Bound', 'The future prime minister displayed flashes of brilliance that equalled the greatest Victorian novelists.', 'Christine Feehan');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1847, 7, 'Dark challenge', 'Charlotte Brontë’s erotic, gothic masterpiece became the sensation of Victorian England. Its great breakthrough was its intimate dialogue with the reader.', 'Christine Feehan');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1847, 7, 'Meet the vampire', 'Emily Brontë’s windswept masterpiece is notable not just for its wild beauty but for its daring reinvention of the novel form itself.', 'Georgess McHargue');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1848, 7, 'Bigfoot and other strange beasts', 'William Thackeray’s masterpiece, set in Regency England, is a bravura performance by a writer at the top of his game.', 'Rob Shone');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1850, 7, 'Your heart', 'David Copperfield marked the point at which Dickens became the great entertainer and also laid the foundations for his later, darker masterpieces.', 'Henry Fielding');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1650, 7, 'Brave New World', 'Far in the future the World Controllers have created the ideal society. Through clever use of genetic engineering, brainwashing, and recreational sex and drugs all its members are happy consumers. Bernard Marx seems alone in harbouring an ill-defined longing to break free.', 'Aldous Huxley');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1678, 7, 'Goethe''s Werke', 'A story of a man in search of truth told with the simple clarity and beauty of Bunyan’s prose make this the ultimate English classic.', 'John Leonard Greenberg');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1719, 6, 'Moralia', 'By the end of the 19th century, no book in English literary history had enjoyed more editions, spin-offs and translations. Crusoe’s world-famous novel is a complex literary confection, and it’s irresistible.', 'Plutarch');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1726, 6, 'Nineteen Eighty-Four', 'A satirical masterpiece that’s never been out of print, Jonathan Swift’s Gulliver’s Travels comes third in our list of the best novels written in English', 'George Orwell');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1748, 6, 'The War of the Worlds', 'Clarissa is a tragic heroine, pressured by her unscrupulous nouveau-riche family to marry a wealthy man she detests, in the book that Samuel Johnson described as “the first book in the world for the knowledge it displays of the human heart.”', 'George Orwell');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1749, 6, 'Island of Doctor Moreau', 'Tom Jones is a classic English novel that captures the spirit of its age and whose famous characters have come to represent Augustan society in all its loquacious, turbulent, comic variety.', 'H. G. Wells');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1759, 6, 'Fahrenheit 451', 'Laurence Sterne’s vivid novel caused delight and consternation when it first appeared and has lost little of its original bite.', 'Ray Bradbury');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1816, 6, 'Fahrenheit 451: Reading the 1950s', 'Jane Austen’s Emma is her masterpiece, mixing the sparkle of her early books with a deep sensibility.', 'Ray Bradbury');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1818, 6, 'A Clockwork Orange', 'Mary Shelley’s first novel has been hailed as a masterpiece of horror and the macabre.', 'Anthony Burgess');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1818, 1, 'Tremor of Intent', 'The great pleasure of Nightmare Abbey, which was inspired by Thomas Love Peacock’s friendship with Shelley, lies in the delight the author takes in poking fun at the romantic movement.', 'Anthony Burgess');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1838, 1, 'Algebra', 'Edgar Allan Poe’s only novel – a classic adventure story with supernatural elements – has fascinated and influenced generations of writers.', 'Eran Graff');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1845, 1, 'Elementary Geometry', 'The future prime minister displayed flashes of brilliance that equalled the greatest Victorian novelists.', 'Eran Graff');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1847, 1, 'Entertaining physics', 'Charlotte Brontë’s erotic, gothic masterpiece became the sensation of Victorian England. Its great breakthrough was its intimate dialogue with the reader.', 'Sergey Ivanov');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1847, 1, 'Interesting biology', 'Emily Brontë’s windswept masterpiece is notable not just for its wild beauty but for its daring reinvention of the novel form itself.', 'Sergey Ivanov');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1848, 1, 'Interesting history', 'William Thackeray’s masterpiece, set in Regency England, is a bravura performance by a writer at the top of his game.', 'William Block');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1850, 1, 'Elementary Philosophy', 'David Copperfield marked the point at which Dickens became the great entertainer and also laid the foundations for his later, darker masterpieces.', 'Daran Jhon');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1650, 1, 'Logic. Theory of probability', 'Nathaniel Hawthorne’s astounding book is full of intense symbolism and as haunting as anything by Edgar Allan Poe.', 'Eran Graff');




CREATE TABLE `library`.`card_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_state_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

insert into `library`.`card_state` (id, `card_state_name`) values (1,'ORDERED');
insert into `library`.`card_state` (id, `card_state_name`) values (2,'AT_HOME');
insert into `library`.`card_state` (id, `card_state_name`) values (3,'AT_HALL');
insert into `library`.`card_state` (id, `card_state_name`) values (4,'RETURNED');
insert into `library`.`card_state` (id, `card_state_name`) values (5,'OVERDUE');




CREATE TABLE `library`.`role` (
  `idrole` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idrole`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

insert into `library`.`role` (idrole, role_name) values (1,'READER');
insert into `library`.`role` (idrole, role_name) values (2,'LIBRARIAN');
insert into `library`.`role` (idrole, role_name) values (3,'ADMINISTRATOR');




CREATE TABLE `library`.`user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_idx` (`role`),
  CONSTRAINT `role` FOREIGN KEY (`role`) REFERENCES `role` (`idrole`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

insert into `library`.`user` (name, login, password) values ('John','john@epam.com','$2a$10$RaCFqaKUBc0ilR6mhKWs6OIw6Amkks3U5Qzjj7eCcLEXT1sNiIxQi');
insert into `library`.`user` (name, role, login, password) values ('Nana',2,'nana@epam.com','$2a$10$6BY5Nljxj7WWSIiOYf1xUeC9lY1M1mGDrs2ATk28RYDGah93VB19a');
insert into `library`.`user` (name, role, login, password) values ('Bob',3,'bob@epam.com','$2a$10$VO0nzvQZ9WSETkt1AOLFyu5DtK./hnM.1PsEcw9MAKHNVTjZcPs.i');


CREATE TABLE `library`.`card` (
  `idhome_card` int(11) NOT NULL AUTO_INCREMENT,
  `book` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `card_state` int(11) NOT NULL,
  PRIMARY KEY (`idhome_card`),
  KEY `idreader_idx` (`user`),
  KEY `book_idx` (`book`),
  KEY `card_state_idx` (`card_state`),
  CONSTRAINT `book` FOREIGN KEY (`book`) REFERENCES `book` (`idbook`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `card_state` FOREIGN KEY (`card_state`) REFERENCES `card_state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reader` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;




SET FOREIGN_KEY_CHECKS=1;

