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
  CONSTRAINT `book_state` FOREIGN KEY (`book_state_id`) REFERENCES `book_state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `genre` FOREIGN KEY (`genre`) REFERENCES `genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (2004, 1, 'Информатика: базовый курс', 'Вводный курс информатики', 'Акулов О.А.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1999, 1, '1001 задача по физике', 'Задачник по физике', 'Гельфгат И.М.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1989, 1, '1001 задача по химии', 'Задачник по химии', 'Акулов О.А.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1999, 1, 'Химия 10: органическая химия', 'Учебник по химии для 10 класса', 'Домбровский А.В.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1995, 1, 'Химия в действии', 'Продвинутый курс химии', 'Холин Ю.В.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1991, 1, 'Биология для подготовительного отделения', 'Подготовительных курс по биологии', 'Ковалев Н.Е.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1985, 2, 'Проблемы общей психологии', 'Информативно метадическое пособие', 'Выготский Л.С.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1982, 2, 'Социальная психология', 'Курс психологии для студентов ВУЗов', 'Андреева Г.М.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1980, 6, 'Толковый словарь русского языка', 'Толковый словарь по русскому языку', 'Даль В.И.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1973, 1, 'Английский язык (3 класс)', 'Английский язык для учащихся третьих классов', 'Богородицкая В.Ж.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (2005, 3, 'Горе от ума', 'Психологический триллер', 'Грибоедов А.С.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (2004, 7, 'Властителям и судьям', 'Литература для легкого чтения', 'Державин Г.Р.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1999, 3, 'Обломов', 'Худ. лит.', 'Гончаров И.А.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1989, 3, 'Анна Снегина', 'Художественная литература', 'Есенин С.А.');
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
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (2004, 1, 'Информатика: базовый курс', 'Вводный курс информатики', 'Акулов О.А.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1999, 1, '1001 задача по физике', 'Задачник по физике', 'Гельфгат И.М.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1989, 1, '1001 задача по химии', 'Задачник по химии', 'Акулов О.А.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1999, 1, 'Химия 10: органическая химия', 'Учебник по химии для 10 класса', 'Домбровский А.В.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1995, 1, 'Химия в действии', 'Продвинутый курс химии', 'Холин Ю.В.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1991, 1, 'Биология для подготовительного отделения', 'Подготовительных курс по биологии', 'Ковалев Н.Е.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1985, 2, 'Проблемы общей психологии', 'Информативно метадическое пособие', 'Выготский Л.С.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1982, 2, 'Социальная психология', 'Курс психологии для студентов ВУЗов', 'Андреева Г.М.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1980, 6, 'Толковый словарь русского языка', 'Толковый словарь по русскому языку', 'Даль В.И.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1973, 1, 'Английский язык (3 класс)', 'Английский язык для учащихся третьих классов', 'Богородицкая В.Ж.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (2005, 3, 'Горе от ума', 'Психологический триллер', 'Грибоедов А.С.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (2004, 7, 'Властителям и судьям', 'Литература для легкого чтения', 'Державин Г.Р.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1999, 3, 'Обломов', 'Худ. лит.', 'Гончаров И.А.');
INSERT INTO `library`.`book` (year, genre, title, description, author) VALUES (1989, 3, 'Анна Снегина', 'Художественная литература', 'Есенин С.А.');
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
insert into `library`.`role` (idrole, role_name) values (3,'ADMINISTATOR');




CREATE TABLE `library`.`user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_idx` (`role`),
  CONSTRAINT `role` FOREIGN KEY (`role`) REFERENCES `role` (`idrole`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

insert into `library`.`user` (name, login, password) values ('John','john@epam.com','$2a$10$XaK/MWIqlRUyl.DqFK3yUuCNO7wJFpNqDu1kCmnC33k9CTQ9LVrfi');
insert into `library`.`user` (name, login, password) values ('Elizabeth','elizabeth@epam.com','$2a$10$Fo09xDgjzrF9ER5NZiT6i.xd8EBTOfM4RhSFUPiiz56HGpUX/wXPO');
insert into `library`.`user` (name, login, password) values ('Tom','tom@epam.com','$2a$10$Z8PfPc619nYZsg54jO81RuKH9EyzNPphyOWnIh4bt0YirarB31WRm');
insert into `library`.`user` (name, role, login, password) values ('Nana',2,'nana@epam.com','$2a$10$LprKcSg5wY82oBKnD7QrSOo0dE44QGVUJ86UWqKsV3jre2.p4llPa');
insert into `library`.`user` (name, login, password) values ('James','james@epam.com','$2a$10$Hp7pdrZMkZxAg/SPM7BcM.k0C0jE58Z9I0l12CWu./Zrvb5qAz.R.');


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
  CONSTRAINT `book` FOREIGN KEY (`book`) REFERENCES `book` (`idbook`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `card_state` FOREIGN KEY (`card_state`) REFERENCES `card_state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reader` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

insert into `library`.`card` (user, book, start_date, end_date, card_state) values (5,56,'2017-01-11','2019-07-10',3);
insert into `library`.`card` (user, book, start_date, end_date, card_state) values (7,54,'2014-03-11','2018-01-03',2);
insert into `library`.`card` (user, book, start_date, end_date, card_state) values (5,61,'2018-04-12','2019-11-15',1);



SET FOREIGN_KEY_CHECKS=1;

