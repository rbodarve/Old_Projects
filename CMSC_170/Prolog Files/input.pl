loader(F) :- see(F),
repeat,
read(X),
nl, 
write('retrieved --> '),
write(X),
asserta(X),
X=end_of_file, %terminating condition
!, seen.
