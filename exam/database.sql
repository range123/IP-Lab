drop table test;
create table test(
question varchar(150),
op1 varchar(30),
op2 varchar(30),
op3 varchar(30),
op4 varchar(30),
answer varchar(30) );

insert into test values("What is the most popular response to 1.e4 ? ","a6","e5","e6","c5","c5");
insert into test values("What is this opening called 1.e4 e5 2.Nf3 Nc6 3.Bb5 ? ","King's Indian Defence","Sicillian Defence","Ruy-Lopez","English opening","Ruy-Lopez");
insert into test values("What this opening called 1.b4 ? ","Polish Opening","King's Pawn","Nimzo-Indian Attack","Bird's Opening","Polish Opening");
insert into test values("What is this opening called 1.e4 e5 2.f4? ","Queen's Gambit","Evan's Gambit","King's Gambit","Smith-morra Gambit","King's Gambit");
insert into test values("What is another name for the Three move mate ? ","Smothered Mate","Scholar's mate","First mate","Child's mate","Scholar's mate");