drop table if exists user_emotion;
drop table if exists users;
drop table if exists emotions;
create table users(
user_id serial primary key,
user_name varchar(50),
password varchar(50),
email varchar(50),
first_name varchar(50),
last_name varchar(50),
type varchar(50),
age integer,
speech_enabled bool default false
);
select * from users;
​
drop table if exists user_emotion;
create table user_emotion(
instance_id serial primary key,
primary_emotion varchar(50),
secondary_emotion varchar(50),
tertiary_emotion varchar(50),
created_at timestamp not null default now(),
linked_user integer,	
foreign key (linked_user) references users (user_id) 
);
select * from user_emotion;


drop table if exists emotions;
create table emotions(
emotion_id serial primary key,
primary_emotion varchar(50),
secondary_emotion varchar(50) default 'default secondary emotion',
secondary_emotion_def varchar (2000),
tertiary_emotion varchar(50),
tertiary_emotion_def varchar(2000)
);
select * from emotions;

​insert into emotions(primary_emotion, secondary_emotion, secondary_emotion_def, tertiary_emotion, tertiary_emotion_def)
values ('anger','hurt','unhappiness or sadness caused by someone''s words or action','embarrassed','to feel awkward, self-conscious, or ashamed'),
('anger','hurt','unhappiness or sadness caused by someone''s words or action','devastated','severe and overwhelming shock or grief'),
('anger','hurt','unhappiness or sadness caused by someone''s words or action','default secondary emotion',''),
('anger','threatened','feeling as if someone has intent to harm you(emotionally or physically)','insecure','uncertain and anxious'),
('anger','threatened','feeling as if someone has intent to harm you(emotionally or physically)','jealous','feeling or showing envy of someone or their achievements and advantages.'),
('anger','threatened','feeling as if someone has intent to harm you(emotionally or physically)','default secondary emotion',''),
('anger','hateful','arousing, deserving of, or filled with hatred','resentful','feeling or expressing bitterness or indignation at having been treated unfairly'),
('anger','hateful','arousing, deserving of, or filled with hatred','violated','fail to respect (someone''s peace, privacy, or rights)'),
('anger','hateful','arousing, deserving of, or filled with hatred','default secondary emotion',''),
('anger','mad','generally upset or displeased','furious','full of anger or energy; violent or intense'),
('anger','mad','generally upset or displeased','enraged','very angry; furious'),
('anger','mad','generally upset or displeased','default secondary emotion',''),
('anger','aggressive','ready or likely to attack or confront','provoked','stimulate or incite (someone) to do or feel something, especially by arousing anger in them'),
('anger','aggressive','ready or likely to attack or confront','hostile','unfriendly; antagonistic'),
('anger','aggressive','ready or likely to attack or confront','default secondary emotion',''),
('anger','frustrated','feeling or expressing distress and annoyance, especially because of inability to change or achieve something','infuriated','make (someone) extremely angry and impatient'),
('anger','frustrated','feeling or expressing distress and annoyance, especially because of inability to change or achieve something','irritated','showing or feeling slight anger; annoyed'),
('anger','frustrated','feeling or expressing distress and annoyance, especially because of inability to change or achieve something','default secondary emotion',''),
('anger','distant','not intimate; cool or reserved','withdrawn','not wanting to communicate with other people'),
('anger','distant','not intimate; cool or reserved','suspicious','feeling cautious distrust'),
('anger','distant','not intimate; cool or reserved','default secondary emotion',''),
('anger','critical','expressing adverse or disapproving comments or judgments','skeptical','not easily convinced; having doubts or reservations'),
('anger','critical','expressing adverse or disapproving comments or judgments','sarcastic','marked by or given to using irony in order to mock or convey contempt'),
('anger','critical','expressing adverse or disapproving comments or judgments','default secondary emotion',''),
('disgust','disapproval','possession or expression of an unfavorable opinion','judgemental','having or displaying an excessively critical point of view'),
('disgust','disapproval','possession or expression of an unfavorable opinion','loathing','a feeling of intense dislike or disgust; hatred'),
('disgust','disapproval','possession or expression of an unfavorable opinion','default secondary emotion',''),
('disgust','disappointed','sad or displeased because someone or something has failed to fulfill one''s hopes or expectations','repugnant','extremely distasteful; unacceptable'),
('disgust','disappointed','sad or displeased because someone or something has failed to fulfill one''s hopes or expectations','revolted','to feel a strong distaste'),
('disgust','disappointed','sad or displeased because someone or something has failed to fulfill one''s hopes or expectations','default secondary emotion',''),
('disgust','awful','very unwell, troubled, or unhappy','revulsion','a sense of disgust, literally translating to ''torn out'''),
('disgust','awful','very unwell, troubled, or unhappy','detestable','deserving intense dislike'),
('disgust','awful','very unwell, troubled, or unhappy','default secondary emotion',''),
('disgust','avoidance','the action of keeping away from or not doing something','aversion','someone or something that arouses strong feelings of dislike'),
('disgust','avoidance','the action of keeping away from or not doing something','hesitant','tentative, unsure, or slow in acting or speaking'),
('disgust','avoidance','the action of keeping away from or not doing something','default secondary emotion',''),
('sad','guilty','culpable of or responsible for a specified wrongdoing','remorseful','filled with guilt, feeling sorry'),
('sad','guilty','culpable of or responsible for a specified wrongdoing','ashamed','embarrassed or guilty because of actions, characteristics, or associations'),
('sad','guilty','culpable of or responsible for a specified wrongdoing','default secondary emotion',''),
('sad','abandoned','having been deserted or cast off','ignored','refuse to take notice of or acknowledge; disregard intentionally'),
('sad','abandoned','having been deserted or cast off','victimized','single (someone) out for cruel or unjust treatment'),
('sad','abandoned','having been deserted or cast off','default secondary emotion',''),
('sad','despair','the complete loss or absence of hope','powerless','without ability, influence, or power'),
('sad','despair','the complete loss or absence of hope','vulnerable','susceptible to physical or emotional attack or harm'),
('sad','despair','the complete loss or absence of hope','default secondary emotion',''),
('sad','depressed','in a state of general unhappiness or despondency','inferior','lower in rank, status, or quality'),
('sad','depressed','in a state of general unhappiness or despondency','empty','having no value or purpose'),
('sad','depressed','in a state of general unhappiness or despondency','default secondary emotion',''),
('sad','lonely','sad because one has no friends or company','abandoned','having been deserted or cast off'),
('sad','lonely','sad because one has no friends or company','isolated','having minimal contact or little in common with others'),
('sad','lonely','sad because one has no friends or company','default secondary emotion',''),
('sad','bored','feeling weary because one is unoccupied or lacks interest in one''s current activity','apathetic','showing or feeling no interest, enthusiasm, or concern'),
('sad','bored','feeling weary because one is unoccupied or lacks interest in one''s current activity','indifferent',''),
('sad','bored','feeling weary because one is unoccupied or lacks interest in one''s current activity','default secondary emotion','having no particular interest or sympathy; unconcerned'),
('happy','optimistic','hopeful and confident about the future','inspired',' exhibiting a creative impulse'),
('happy','optimistic','hopeful and confident about the future','open','frank and communicative; not given to deception or concealment'),
('happy','optimistic','hopeful and confident about the future','default secondary emotion',''),
('happy','intimate','involving very close connection','playful','giving or expressing pleasure and amusement'),
('happy','intimate','involving very close connection','sensitive','having or displaying a quick and delicate appreciation of feelings'),
('happy','intimate','involving very close connection','default secondary emotion',''),
('happy','peaceful','free from disturbance; tranquil','hopeful','feeling or inspiring optimism about a future event'),
('happy','peaceful','free from disturbance; tranquil','loving','feeling or showing love or great care'),
('happy','peaceful','free from disturbance; tranquil','default secondary emotion',''),
('happy','powerful','having control and influence over people and events','provocative','causing annoyance, anger, or another strong reaction, especially deliberately'),
('happy','powerful','having control and influence over people and events','courageous','not deterred by danger or pain; brave'),
('happy','powerful','having control and influence over people and events','default secondary emotion',''),
('happy','accepted','regard favorably or with approval; welcome','respected','admire (someone or something) deeply, as a result of their abilities, qualities, or achievements'),
('happy','accepted','regard favorably or with approval; welcome','fulfilled','satisfied or happy because of fully developing abilities or character'),
('happy','accepted','regard favorably or with approval; welcome','default secondary emotion',''),
('happy','proud','satisfaction as a result of achievements','important','of great significance or value'),
('happy','proud','satisfaction as a result of achievements','confident','feeling or showing confidence in oneself; self-assured'),
('happy','proud','satisfaction as a result of achievements','default secondary emotion',''),
('happy','interested','showing curiosity or concern about something or someone','inquisitive','unduly curious about the affairs of others'),
('happy','interested','showing curiosity or concern about something or someone','amused','finding something funny or entertaining'),
('happy','interested','showing curiosity or concern about something or someone','default secondary emotion',''),
('happy','joyful','feeling, expressing, or causing great pleasure and happiness','liberated','freed from imprisonment'),
('happy','joyful','feeling, expressing, or causing great pleasure and happiness','ecstatic','feeling or expressing overwhelming happiness or joyful excitement'),
('happy','joyful','feeling, expressing, or causing great pleasure and happiness','default secondary emotion',''),
('surprise','excited','very enthusiastic and eager','energetic','showing or involving great activity or vitality'),
('surprise','excited','very enthusiastic and eager','eager','wanting to do or have something very much'),
('surprise','excited','very enthusiastic and eager','default secondary emotion',''),
('surprise','amazed','greatly surprised; astonished','awe','a feeling of reverential respect mixed with fear or wonder'),
('surprise','amazed','greatly surprised; astonished','astonished','greatly surprised or impressed; amazed'),
('surprise','amazed','greatly surprised; astonished','default secondary emotion',''),
('surprise','confused','unable to think clearly; bewildered','perplexed','completely baffled; very puzzled'),
('surprise','confused','unable to think clearly; bewildered','disillusioned','disappointed in someone or something that one discovers to be less good than one had believed'),
('surprise','confused','unable to think clearly; bewildered','default secondary emotion',''),
('surprise','startled','feeling or showing sudden shock or alarm','dismayed','cause (someone) to feel consternation and distress'),
('surprise','startled','feeling or showing sudden shock or alarm','shocked','cause (someone) to feel surprised and upset'),
('surprise','startled','feeling or showing sudden shock or alarm','default secondary emotion',''),
('fear','scared','fearful; frightened','terrified','cause to feel extreme fear'),
('fear','scared','fearful; frightened','frightened','afraid or anxious'),
('fear','scared','fearful; frightened','default secondary emotion',''),
('fear','anxious','experiencing worry, unease, or nervousness, typically about an imminent event or something with an uncertain outcome','overwhelmed','defeated completely'),
('fear','anxious','experiencing worry, unease, or nervousness, typically about an imminent event or something with an uncertain outcome','worried','anxious or troubled about actual or potential problems'),
('fear','anxious','experiencing worry, unease, or nervousness, typically about an imminent event or something with an uncertain outcome','default secondary emotion',''),
('fear','insecure',' not confident or assured; uncertain and anxious','inadequate','lacking the quality or quantity required'),
('fear','insecure',' not confident or assured; uncertain and anxious','inferior','lower in rank, status, or quality'),
('fear','insecure',' not confident or assured; uncertain and anxious','default secondary emotion',''),
('fear','submissive','meekly obedient or passive','worthless','having no good qualities; deserving contempt'),
('fear','submissive','meekly obedient or passive','insignificant','too small or unimportant to be worth consideration'),
('fear','submissive','meekly obedient or passive','default secondary emotion',''),
('fear','rejected','to dismiss as inadequate','inadequate','lacking the quality or quantity required'),
('fear','rejected','to dismiss as inadequate','alienated','experiencing or inducing feelings of isolation or estrangement'),
('fear','rejected','to dismiss as inadequate','default secondary emotion',''),
('fear','humiliated','make (someone) feel ashamed and foolish by injuring their dignity and self-respect','disrespected','show a lack of respect for; insult'),
('fear','humiliated','make (someone) feel ashamed and foolish by injuring their dignity and self-respect','ridiculed','subject (someone or something) to contemptuous and dismissive language or behavior'),
('fear','humiliated','make (someone) feel ashamed and foolish by injuring their dignity and self-respect','default secondary emotion','');






drop table if exists mantras;
create table mantras(
mantra_id serial primary key,
mantra varchar(1000),
primary_emotion varchar(50),	
secondary_emotion varchar(50),
tertiary_emotion varchar(50),
keywords varchar(250),
exercises varchar(250),
activity varchar (250)
);
insert into mantras(mantra, primary_emotion, secondary_emotion, keywords)
values('Before you can love others you must first love yourself.','positive','love','self-love,acceptance');
insert into mantras(mantra, primary_emotion, secondary_emotion, keywords)
values('If you ever find yourself in the wrong story, leave','negative','contempt','confidence, assertiveness');
​
select * from mantras








