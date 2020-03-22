use_module(library(pio)).
:- include('../listprologinterpreter/la_strings').

%% split_on_phrases1("grand title","phrasesfile.txt","inputfile.txt").

split_on_phrases1(Title,PhrasesFile,InputFile) :-
	get_phrases(PhrasesFile,Phrases),
	split_on_phrases2(Phrases,InputFile,Text,Title),
	write_files(Text),!.

get_phrases(PhrasesFile,Phrases) :-
	SepandPad="\n",
	phrase_from_file_s(string(String00), PhrasesFile),
	split_string(String00,SepandPad,SepandPad,List1),
	delete(List1,"",Phrases1),
	findall(Text6,(member(Text7,Phrases1),
		string_codes(Text6,Text7)),Phrases).

split_on_phrases2(Phrases2,InputFile,Text4,Title) :-
	phrase_from_file_s(string(Text2), InputFile),
	%%string_codes(Phrases1,Phrases2),
	%%string_codes(Text2,Text1),
	split_on_phrases3(Phrases2,Text2,[],Text3,Title),
	%%term_to_atom([split_on_phrases3(Phrases2,Text2,[],Text3,Title)],AA),
	%%writeln1(AA),
	%%findall(Text4a,(member(Text7,Text3),
		findall([A1,B1],(member(Text8,Text3),Text8=[A,B],
		string_codes(A,A1),string_codes(B,B1)),Text4).%%),Text4).
	
split_on_phrases3([],_Text1,Text2,Text2,_Title) :- !.
%%split_on_phrases3(_Phrases1,[],Text2,Text2,_Title) :- !.
%%	Phrases1=[Phrase2],
		
split_on_phrases3(Phrases1,Text1,Text2,Text3,Title) :-
	(Phrases1=[Phrase2b,Phrase2a|Phrases3]->true;
	(Phrases1=[Phrase2b],
	Phrase2a="eof",Phrases3=[])),
	length(Phrases1,Phrases1L),
	writeln(Phrase2b),
split_on_phrases3a(Phrase2b,Text1,Text2,Title,Phrase2a,E14,Phrases4,Phrases1L),
(Phrase2a="eof"->(%%writeln([phrases3,Phrases3]),
Phrases3=Phrases3a);
(%%writeln(append([Phrase2a],Phrases3,Phrases3a)),
		append([Phrase2a],Phrases3,Phrases3a))),
	split_on_phrases3(Phrases3a,E14,Phrases4,Text3,Title).

split_on_phrases3a(Phrase2b,Text1,Text2,Title,Phrase2a,E14,Phrases4,Phrases1L) :-
	%%string_concat(Phrase2b,"\n",Phrase2c),
	%%string_codes(Phrase2c,Phrase2),
	string_codes(Phrase2b,Phrase22),
	string_codes("1.",String1),
	string_codes("11.",String11),
	string_codes("21.",String21),
	string_codes("31.",String31),
	string_codes(Phrase2a,Phrase2aa),
	string_codes("eof",EofC),

	(
		(%%Phrases1L=1->
			%%split_on_phrases4(Text1,E11,Text2,Text4,
			%%String1,Phrase22,EofC,Title,1)
			%%;
			split_on_phrases41(Text1,E11,Text2,Text4,
			String1,Phrase22,String11,Title,1,Phrase2aa),
			writeln("11")
		)->
			((%Phrases1L=1->
				%%split_on_phrases4(E11,E12,Text4,Text5,
				%%String11,Phrase22,EofC,Title,2)
				%%;
				split_on_phrases41(E11,E12,Text4,Text5,
				String11,Phrase22,String21,Title,2,Phrase2aa),
				writeln("21")
			)->
				((%%Phrases1L=1->
					%%split_on_phrases4(E12,E13,Text5,Text6,
					%%String21,Phrase22,EofC,Title,3)
					%%;
					split_on_phrases41(E12,E13,Text5,Text6,
					String21,Phrase22,String31,Title,3,Phrase2aa),
					writeln("31")
				)->
				(
					((Phrases1L=1->
						((split_on_phrases4(E13,E14,Text6,Phrases4,
						String31,Phrase22,EofC,Title,4),
						writeln("eof"))->
							true;(writeln("Error: No eof."),abort)
						)
						;
						(%%writeln("here"),
						%%writeln(split_on_phrases4(E13,E14,Text6,Phrases4,
						%%String31,Phrase22,Phrase2aa,Title,4)),
						%%(
						(split_on_phrases42(E13,E14,Text6,Phrases4,
						String31,Phrase22,_Empty,Title,4,Phrase2aa),
						writeln("-"))%%->
							%%true;(E13=E14,Text6=Phrases4)
						)
						)
					)
				)
				;
				(Phrases1L=1->
					(split_on_phrases4(E12,E14,Text5,Phrases4,
					String21,Phrase22,EofC,Title,3),
					writeln("eof"))
					;
					(split_on_phrases41(E12,E14,Text5,Phrases4,
					String21,Phrase22,String31,Title,3,Phrase2aa),%%->
						%%true;(E12=E14,Text5=Phrases4)
						writeln("31"))
				))
			;
			(Phrases1L=1->
				(split_on_phrases4(E11,E14,Text4,Phrases4,
				String11,Phrase22,EofC,Title,2),
				writeln("eof"))
				;
				(split_on_phrases41(E11,E14,Text4,Phrases4,
				String11,Phrase22,String21,Title,2,Phrase2aa),%%->
						%%true;(E11=E14,Text4=Phrases4)
						writeln("21"))
			))
		;
		(Phrases1L=1->
			(split_on_phrases4(Text1,E14,Text2,Phrases4,
			String1,Phrase22,EofC,Title,1),
			writeln("eof"))
			;
			(split_on_phrases41(Text1,E14,Text2,Phrases4,
			String1,Phrase22,String11,Title,1,Phrase2aa),%%->
						%%true;(Text1=E14,Text2=Phrases4)
						writeln("11"))
		)
	).
	%%append_list([Text4,Text5,Text6,Text7],Phrases4).

split_on_phrases4(Text1,E11,Text2,Text4,Phrase2,Phrase22,Phrase2a,Title,N) :-
	split_on_phrases4a(Text1,_C1,D1,Phrase2,_E1),
	%%string_codes(C,C1),
	%%string_codes(D,D1),
	string_codes(Phrase20,Phrase2),
	string_codes(Phrase202,Phrase22),
	split_on_phrases4b(D1,Phrase2a,E11,C11,_),
	string_codes(C110,C11),
	concat_list([Phrase20,C110],C12),
	string_codes(C10,C12),
	number_string(N,NS),
	concat_list([Title," ","by Lucian Green"," ",Phrase202," ",NS," of 4.txt"],E101),
	concat_list([Title,"\n","by Lucian Green","\n",Phrase202," ",NS," of 4\n\n",C10],C122),
	append(Text2,[[E101,C122]],Text4).

split_on_phrases4a(Text1,C1,D1,Phrase2,E1) :-
	append(C1,E1,Text1),
	append(Phrase2,D1,E1).
split_on_phrases4b(D1,Phrase2a,E11,C11,D10) :-
	append(C11,E11,D1),
	%%writeln1(append(Phrase2a,D10,E11)),
	append(Phrase2a,D10,E11).	

split_on_phrases41(Text1,E11,Text2,Text4,Phrase2,Phrase22,Phrase2a,Title,N,Phrase2aa) :-

string_codes(Text1z,Text1),
%%*string_codes(E11z,E11),
%%string_codes(Text2z,Text2),
%%*string_codes(Text4z,Text4),
string_codes(Phrase2z,Phrase2),
string_codes(Phrase22z,Phrase22),
string_codes(Phrase2az,Phrase2a),
string_codes(Titlez,Title),
%%*string_codes(Nz,N),
string_codes(Phrase2aaz,Phrase2aa),
%%writeln1(split_on_phrases41(Text1z,_E11z,Text2,_Text4z,Phrase2z,Phrase22z,Phrase2az,Titlez,N,Phrase2aaz)),


%%string_codes(Text1z,Text1),writeln([text1,Text1z]),
		%%writeln(split_on_phrases4b(Text1,Phrase2aa,E11x,Text1a,D100)),
		split_on_phrases4b(Text1,Phrase2aa,E11x,Text1a,D100),

string_codes(Text1z,Text1),
string_codes(Phrase2aaz,Phrase2aa),
string_codes(E11xz,E11x),
string_codes(Text1az,Text1a),
string_codes(D100z,D100),

%%writeln1(		split_on_phrases4b(Text1z,Phrase2aaz,E11xz,Text1az,D100z)),

%%writeln1(	split_on_phrases4a(Text1a,_C1,D1,Phrase2,_E1)),
	split_on_phrases4a(Text1a,C1,D1,Phrase2,E1),
	
string_codes(C1z,C1),
string_codes(D1z,D1),
string_codes(E1z,E1),
		%%writeln(split_on_phrases4a(Text1a,C1z,D1z,Phrase2z,E1z)),

	%%string_codes(C,C1),
	%%string_codes(D,D1),
	%%string_codes(Phrase20,Phrase2),
	string_codes(Phrase202,Phrase22),
	
	%%writeln1(		split_on_phrases4b(Text1a,Phrase2a,_,_,_)),
		(split_on_phrases4b(Text1a,Phrase2a,_E11q,_C11q,_D10q)-> %% D1->Text1a

		((split_on_phrases4b(Text1,Phrase22,_,_,C11r)->true;
		C11r=Text1), %% old
		split_on_phrases4b(C11r,Phrase2a,E11,C11,_D102));
		%%split_on_phrases4b(Text1a,Phrase2,_E11q,_C11q,_D10q));
		(C11=Text1a,E11=E11x)), %% old

%%writeln1(split_on_phrases4b(D1,Phrase2aa,_F112,G11)),
	%%split_on_phrases4b(D10,Phrase2aa,_F11,G11,H),
		%%()split_on_phrases4b(D1,Phrase2a,E11,C11),
	
	%%split_on_phrases4b(G11,Phrase2a,E11,C11),
	string_codes(C110,C11),
	concat_list([%%Phrase20,
	C110%%,E11
	],C12),
	string_codes(C10,C12),
	number_string(N,NS),
	concat_list([Title," ","by Lucian Green"," ",Phrase202," ",NS," of 4.txt"],E101),
	concat_list([Title,"\n","by Lucian Green","\n",Phrase202," ",NS," of 4\n\n",C10],C122),
	append(Text2,[[E101,C122]],Text4).

split_on_phrases42(Text1,E11,Text2,Text4,_Phrase2,Phrase22,_Phrase2a,Title,N,Phrase2aa) :-

string_codes(Text1z,Text1),
%%string_codes(E11z,E11),
%%string_codes(Text2z,Text2),
%%string_codes(Text4z,Text4),
%%string_codes(Phrase2z,Phrase2),
%%string_codes(Phrase22z,Phrase22),
%%string_codes(Phrase2az,Phrase2a),
%%string_codes(Titlez,Title),
%%string_codes(Nz,N),
string_codes(Phrase2aaz,Phrase2aa),
%%writeln1(split_on_phrases41(Text1z,E11z,Text2z,Text4z,Phrase2z,Phrase22z,Phrase2az,Titlez,N,Phrase2aaz)),
%%string_codes(Text1z,Text1),%%writeln([text1,Text1z]),
		split_on_phrases4b(Text1,Phrase2aa,E11,C11,E11x),
		string_codes(E11z,E11),
string_codes(C11z,C11),
string_codes(E11xz,E11x),
%%***writeln1(split_on_phrases4b_42here(Text1z,Phrase2aaz,E11z,C11z,E11xz)),
(C11=[]->Text4=Text2;(
%%string_codes(Text1z,Text1),
%%string_codes(Phrase2aaz,Phrase2aa),
%%string_codes(Text1az,Text1a),
%%string_codes(D100z,D100),

%%writeln1(		split_on_phrases4b(Text1z,Phrase2aaz,E11z,Text1az,D100z)),

%%writeln1(	split_on_phrases4a(Text1a,_C1,D1,Phrase2,_E1)),
	%%*split_on_phrases4a(Text1a,_C1,_D1,Phrase2,_E1),
	%%string_codes(C,C1),
	%%string_codes(D,D1),
	%%string_codes(Phrase20,Phrase2),
	string_codes(Phrase202,Phrase22),
	
	%%*writeln1(		split_on_phrases4b(Text1a,Phrase2a,E11,C11,_D10)),
		%%*(split_on_phrases4b(Text1a,Phrase2a,_E11q,_C11q,_D10q)-> %% D1->Text1a
/**
		((split_on_phrases4b(Text1,Phrase22,_,_,C11r)->true;
		C11r=Text1), %% old
		split_on_phrases4b(C11r,Phrase2a,E11,C11,_D102));
		%%split_on_phrases4b(Text1a,Phrase2,_E11q,_C11q,_D10q));
		(C11=Text1a,E11=E11x)), %% old
**/
%%writeln1(split_on_phrases4b(D1,Phrase2aa,_F112,G11)),
	%%split_on_phrases4b(D10,Phrase2aa,_F11,G11,H),
		%%()split_on_phrases4b(D1,Phrase2a,E11,C11),
	
	%%split_on_phrases4b(G11,Phrase2a,E11,C11),
	string_codes(C110,C11),
	concat_list([%%Phrase20,
	C110%%,E11
	],C12),
	string_codes(C10,C12),
	number_string(N,NS),
	concat_list([Title," ","by Lucian Green"," ",Phrase202," ",NS," of 4.txt"],E101),
	concat_list([Title,"\n","by Lucian Green","\n",Phrase202," ",NS," of 4\n\n",C10],C122),
	append(Text2,[[E101,C122]],Text4))).
	%%writeln([e11,E11]).

write_files(Text1) :-
	findall(_,(member(Text2,Text1),%%member(Text2,Text3),%%member(Text2,Text4),
	Text2=[Title1,Contents1],string_codes(Title2,Title1),string_codes(Contents2,Contents1),
	write_file(Title2,Contents2)),_).
	
write_file(File,String) :-
	open_s(File,write,Stream),
	write(Stream,String),
 	close(Stream).

string(String) --> list(String).

list([]) --> [].
list([L|Ls]) --> [L], list(Ls).
