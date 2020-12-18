--create new table

CREATE TABLE [user] (
  user_id int NOT NULL PRIMARY KEY,
  nickname varchar(max),
  age integer,
  sex varchar(max),
  email varchar(max),
  sign_up_date datetime,
  last_login datetime
);

CREATE TABLE category (
  category_id int NOT NULL PRIMARY KEY,
  category_name varchar(max)
);

CREATE TABLE video (
  video_id int NOT NULL PRIMARY KEY,
  video_title varchar(max),
  size float,
  user_id int FOREIGN KEY REFERENCES [user] (user_id),
  category_id int FOREIGN KEY REFERENCES category (category_id),
  create_date datetime,
  video_url varchar(max),
  video_length int,
  video_resolution varchar(max),
  video_format varchar(max),
);

CREATE TABLE watch_record (
  video_id int NOT NULL FOREIGN KEY REFERENCES video (video_id),
  user_id int NOT NULL REFERENCES [user] (user_id),
  watch_time datetime NOT NULL,
  duration int
  PRIMARY KEY (video_id, user_id, watch_time)
);

CREATE TABLE liked_record (
  video_id int NOT NULL FOREIGN KEY REFERENCES video (video_id),
  user_id int NOT NULL REFERENCES [user] (user_id),
  liked_time datetime
  PRIMARY KEY (video_id, user_id)
);

CREATE TABLE comment_record (
  comment_id int NOT NULL PRIMARY KEY,
  video_id int FOREIGN KEY REFERENCES video (video_id),
  user_id int REFERENCES [user] (user_id),
  create_date datetime,
  content varchar(max),
);

CREATE TABLE comment_liked_record (
  comment_id int NOT NULL FOREIGN KEY REFERENCES comment_record (comment_id),
  user_id int NOT NULL REFERENCES [user] (user_id),
  liked_time datetime
  PRIMARY KEY (comment_id, user_id)
);

CREATE TABLE follow_comment_record (
  follow_comment_id int NOT NULL PRIMARY KEY,
  comment_id int NOT NULL FOREIGN KEY REFERENCES comment_record (comment_id),
  user_id int REFERENCES [user] (user_id),
  comment_text varchar(max),
  comment_date datetime
);

CREATE TABLE follow_comment_liked_record (
  follow_comment_id int NOT NULL,
  user_id int NOT NULL REFERENCES [user] (user_id),
  liked_time datetime,
  FOREIGN KEY (follow_comment_id) REFERENCES follow_comment_record (follow_comment_id),
  PRIMARY KEY (follow_comment_id, user_id)
);

CREATE TABLE downloaded_Video (
  video_id int NOT NULL FOREIGN KEY REFERENCES video (video_id),
  user_id int NOT NULL REFERENCES [user] (user_id),
  category_id int FOREIGN KEY REFERENCES category (category_id),
  description varchar(max),
  dowload_date datetime
  PRIMARY KEY (video_id, user_id)
);

--user
Insert into [user] values ('531046793', 'ronkid', 29, 'male', 'ronkid@outlook.com', '2005-05-23', '2020-12-3');
Insert into [user] values ('411520316', 'woofwent', 18, 'female', 'woof@gmail.com', '2000-04-17', '2020-11-29');
Insert into [user] values ('225402606', 'tellwin', 15, 'male', 'tellwin97@yahoo.com', '1997-09-01', '2019-12-31');
Insert into [user] values ('514748301', 'poeseggs99', 30, 'female', 'poese11@outlook.com', '2010-03-17', '2020-12-10');
Insert into [user] values ('416803194', 'lemonynike', 22, 'else', 'monynik1342@gmail.com', '1985-07-02', '2019-06-06');
Insert into [user] values ('355603258', 'acklit', 45, 'male', 'acklit@163.com', '2009-07-28', '2020-01-03');
Insert into [user] values ('635991040', 'hlmviq', 24, 'female', 'hlmviq@gmail.com', '2000-12-4','2020-12-11');
Insert into [user] values ('136543933', 'utkzssi', 17, 'male', 'utkzssi@outlook,com', '2013-02-04', '2020-11-09');
Insert into [user] values ('548417719', 'onwhywt', 37, 'males', 'onwhywt@gmail.com', '1999-12-22','2020-04-13');
Insert into [user] values ('243270870', 'sbufxxxfs', 20, 'female', 'sbufxxxfs@outlook.com', '2017-09-08','2020-11-10');
Insert into [user] values ('355603258', 'acklit', 45, 'male', 'acklit@163.com', '2009-07-28', '2020-01-03');
Insert into [user] values ('635991040', 'hlmviq', 24, 'female', 'hlmviq@gmail.com', '2000-12-4','2020-12-11');
Insert into [user] values ('136543933', 'utkzssi', 17, 'male', 'utkzssi@outlook,com', '2013-02-04', '2020-11-09');
Insert into [user] values ('548417719', 'onwhywt', 37, 'males', 'onwhywt@gmail.com', '1999-12-22','2020-04-13');
Insert into [user] values ('243270870', 'sbufxxxfs', 20, 'female', 'sbufxxxfs@outlook.com', '2017-09-08','2020-11-10');

SELECT *
FROM [user];
--video

Insert into video values ('687143469', 'ube cake', 21.56, '416803194', '04', '2018-07-02', 'www.ubecake.com', 304, '1080p', 'mp4');
Insert into video values ('094330492', 'Fried Chicken', 30.7612, '416803194', '01', '2020-07-02', 'www.friedchicken.com', 543, '4k', 'mp4');
Insert into video values ('032616036', 'Travel in Japan', 100.56, '225402606', '03', '2019-12-21', 'www.sdfddcTravel.com', 3641, '1080p', 'AVI');
Insert into video values ('787500352', 'Birthday Song', 20.15, '531046793', '06', '2020-07-02', 'www.sdjfsdj23.com', 276, '720p', 'WMV');
Insert into video values ('178164354', 'Love Story', 40.14, '136543933', '06','2018-12-09', 'www.lovestory.com', 2564, '1080p','mp4')
Insert into video values ('568158461', 'the Forbidden City', 53.87, '225402606', '03','2000-03-21', 'www.theforbiddencity.com',8675, '1080p','WMV');
Insert into video values ('692659300', 'linear algebra', 42.35, '243270870','07', '2020-04-13','www.linearalgebra',532, '720p','WMV');
Insert into video values ('731678419', 'Intro to SQL', 68.79, '548417719','07','2015-12-04','www.introtosql.com', 4533, '1080p','WMV');
Insert into video values ('178164354', 'Love Story', 40.14, '136543933', '06','2018-12-09', 'www.lovestory.com', 2564, '1080p','mp4')
Insert into video values ('568158461', 'the Forbidden City', 53.87, '225402606', '03','2000-03-21', 'www.theforbiddencity.com',8675, '1080p','WMV');
Insert into video values ('692659300', 'linear algebra', 42.35, '243270870','07', '2020-04-13','www.linearalgebra',532, '720p','WMV');
Insert into video values ('731678419', 'Intro to SQL', 68.79, '548417719','07','2015-12-04','www.introtosql.com', 4533, '1080p','WMV');


SELECT * FROM video

--category
Insert into category values (01, 'Food');
Insert into category values (02, 'Sports');
Insert into category values (03, 'Travel');
Insert into category values (04, 'Baking');
Insert into category values (05, 'Cartoon');
Insert into category values (06, 'Music');
Insert into category values (07, 'education');

--downloaded_video
Insert into downloaded_Video values ('687143469', '531046793', 04, '', 2020-08-11);
Insert into downloaded_Video values ('687143469', '225402606', 04, '', 2020-09-15);
Insert into downloaded_Video values ('687143469', '416803194', 04, 'Dowload', 2020-10-17);
Insert into downloaded_Video values ('094330492', '531046793', 01, '', 2020-10-23);
Insert into downloaded_Video values ('787500352', '514748301', 06, '', 2020-11-11);
Insert into downloaded_Video values ('731678419', '548417719', 07, 'for INFO330',2020-10-28);
Insert into downloaded_Video values ('731678419', '635991040', 07, '',2019-12-28);
Insert into downloaded_Video values('568158461', '136543933', 03, '', 2018-10-14);
Insert into downloaded_Video values('178164354', '136543933', 06, '', 2019-04-07);
Insert into downloaded_Video values ('787500352', '243270870', 03, '', 2008-10-12);

SELECT * FROM downloaded_Video;

--liked_record
INSERT INTO liked_record VALUES ('687143469', '531046793', '2019-08-20');
INSERT INTO liked_record VALUES ('687143469', '225402606', '2019-06-20');
INSERT INTO liked_record VALUES ('094330492', '531046793', '2019-12-20');
INSERT INTO liked_record VALUES ('094330492', '416803194', '2020-01-19');
INSERT INTO liked_record VALUES ('032616036', '411520316', '2020-05-12');
INSERT INTO liked_record VALUES ('568158461', '411520316', '2020-05-12');
INSERT INTO liked_record VALUES ('731678419', '548417719', '2019-06-14');
INSERT INTO liked_record VALUES ('731678419', '355603258', '2018-05-24');
INSERT INTO liked_record VALUES ('692659300', '548417719', '2018-04-15');
INSERT INTO liked_record VALUES ('692659300','136543933', '2019-12-11');

SELECT * FROM liked_record;

--watch_record
INSERT INTO watch_record VALUES ('687143469', '531046793', '2019-08-20', 12);
INSERT INTO watch_record VALUES ('687143469', '225402606', '2019-06-20', 60);
INSERT INTO watch_record VALUES ('094330492', '531046793', '2019-12-20', 180);
INSERT INTO watch_record VALUES ('094330492', '416803194', '2020-01-19', 145);
INSERT INTO watch_record VALUES ('032616036', '411520316', '2020-05-12', 111);
INSERT INTO watch_record VALUES ('032616036', '548417719', '2016-08-24', 320);
INSERT INTO watch_record VALUES ('692659300', '635991040', '2008-06-27', 20);
INSERT INTO watch_record VALUES ('731678419', '355603258', '2019-05-07', 100);
INSERT INTO watch_record VALUES ('178164354', '243270870', '2014-10-04', 149);
INSERT INTO watch_record VALUES ('568158461', '136543933', '2019-05-21',89);

SELECT * FROM watch_record;

--comment_record
INSERT INTO comment_record VALUES ('513527498', '687143469', '531046793', '2019-08-20', 'this is so cool');
INSERT INTO comment_record VALUES ('037945214', '687143469', '225402606', '2019-06-20', 'nice video');
INSERT INTO comment_record VALUES ('675900481', '094330492', '531046793', '2019-12-20', 'Not bad');
INSERT INTO comment_record VALUES ('728884126', '094330492', '416803194', '2020-01-19', 'best fried chick ever');
INSERT INTO comment_record VALUES ('466475281', '032616036', '411520316', '2020-05-12', 'I wanna go to Japan this summer');
INSERT INTO comment_record VALUES ('972170143', '178164354', '635991040', '2019-10-28', 'Taylor Swift is my fav');
INSERT INTO comment_record VALUES ('069380159', '568158461', '531046793', '2009-02-03', 'Really want to see it for real');
INSERT INTO comment_record VALUES ('815147609', '692659300', '635991040', '2020-10-11', 'Hard');
INSERT INTO comment_record VALUES ('013800247', '731678419', '548417719', '2008-05-16', 'Useful to know');
INSERT INTO comment_record VALUES ('019610566', '731678419', '243270870', '2020-10-01', 'helpful for my sql class');

--comment_liked_record
INSERT INTO comment_liked_record VALUES ('513527498', '531046793', '2019-01-11');
INSERT INTO comment_liked_record VALUES ('037945214', '531046793','2018-07-27');
INSERT INTO comment_liked_record VALUES ('675900481', '416803194','2020-08-22');
INSERT INTO comment_liked_record VALUES ('466475281', '225402606', '2019-09-17');
INSERT INTO comment_liked_record VALUES ('069380159','514748301', '2020-08-24');
INSERT INTO comment_liked_record VALUES ('069380159', '411520316', '2019-10-12');
INSERT INTO comment_liked_record VALUES ('019610566', '411520316', '2019-06-11');
INSERT INTO comment_liked_record VALUES ('019610566', '514748301', '2020-12-10');
INSERT INTO comment_liked_record VALUES ('815147609', '514748301', '2018-05-12');

SELECT * FROM comment_liked_record;

--follow_comment_record
INSERT INTO follow_comment_record VALUES ('473852883', '513527498', '531046793', 'I dont agree', '2019-08-20');
INSERT INTO follow_comment_record VALUES ('495113970', '037945214', '225402606', 'yep', '2019-06-20');
INSERT INTO follow_comment_record VALUES ('450579850', '675900481', '416803194', 'yeah, same!', '2019-12-20');
INSERT INTO follow_comment_record VALUES ('761923635', '728884126', '225402606', 'lol', '2020-01-19');
INSERT INTO follow_comment_record VALUES ('132536782', '466475281', '411520316', 'nice', '2020-05-12');
INSERT INTO follow_comment_record VALUES ('047592927', '019610566','225402606','agree', '2020-10-12');
INSERT INTO follow_comment_record VALUES ('410301180', '019610566','531046793', 'no way', '2020-10-01');
INSERT INTO follow_comment_record VALUES ('188289834', '815147609','531046793','same','2020-11-02');
INSERT INTO follow_comment_record VALUES ('493321824', '466475281', '416803194','hopefully yes', '2019-10-11');
INSERT INTO follow_comment_record VALUES ('876314788', '069380159', '416803194', 'cannot agree more', '2020-11-15');

SELECT * FROM follow_comment_record;
--follow_comment_liked_record
INSERT INTO follow_comment_liked_record VALUES ('473852883', '531046793', '2019-08-29');
INSERT INTO follow_comment_liked_record VALUES ('495113970', '225402606', '2019-05-25');
INSERT INTO follow_comment_liked_record VALUES ('450579850', '416803194', '2019-11-11');
INSERT INTO follow_comment_liked_record VALUES ('761923635', '225402606', '2019-01-19');
INSERT INTO follow_comment_liked_record VALUES ('132536782', '411520316', '2020-07-15');
INSERT INTO follow_comment_liked_record VALUES ('410301180', '136543933', '2020-05-12');
INSERT INTO follow_comment_liked_record VALUES ('493321824', '243270870', '2019-12-12');
INSERT INTO follow_comment_liked_record VALUES ('188289834', '416803194', '2018-12-12');
INSERT INTO follow_comment_liked_record VALUES ('188289834', '225402606', '2020-12-12');
INSERT INTO follow_comment_liked_record VALUES ('047592927', '136543933', '2019-07-14');

-- q1. What is the most liked video in 'music' category?
create VIEW most_liked_music_video
AS (
  select top 1 v.video_title, count(*) as number_of_liked
  from video v, liked_record lr, category c
  where v.video_id = lr.video_id
  and v.category_id = c.category_id
  and c.category_id = '06'
  group by v.video_title
  order by count(*)
)

-- q2. What is the like rate (LTR), comment rate (CMTR) for a given (set of) video?

DROP VIEW ltr_cmtr;

CREATE VIEW ltr_cmtr
AS (
    select
        vv.video_id,
        round(1.0 * lk_cnt/view_cnt,3) as ltr,
        round(1.0 * cmt_cnt/view_cnt,3) as cmtr

    from (
        select video_id, count(distinct user_id) as view_cnt
        from watch_record
        group by video_id
    ) vv left join
    (
        select video_id, count(distinct user_id) as lk_cnt
        from liked_record
        group by video_id
    ) lk on vv.video_id = lk.video_id
    left join (
        select video_id, count(distinct user_id) as cmt_cnt
        from comment_record
        group by video_id
    ) cmt on vv.video_id = cmt.video_id
)

select * from ltr_cmtr


--q3. How many uploaders would comment below their videos?

CREATE VIEW uploader_comment_their_own
AS (
    SELECT distinct r.user_id
    FROM  comment_record r, video v
    WHERE r.user_id = v.user_id
    AND r.video_id = v.video_id
    GROUP BY r.user_id
)

--q4. What is the most played video?
WITH selected AS (SELECT TOP 1 wr.video_id, COUNT(user_id) AS view_count
                FROM  watch_record wr
                GROUP BY video_id
                ORDER BY COUNT(user_id) DESC)
SELECT *
FROM video V
JOIN selected S
ON V.video_id = S.video_id;
