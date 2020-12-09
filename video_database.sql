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
