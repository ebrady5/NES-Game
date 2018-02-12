CC65 = cc65
CA65 = ca65
LD65 = ld65
NAME = main


$(NAME).nes: $(NAME).o reset.o asm4c.o nes.cfg
	$(LD65) -C nes.cfg -o $(NAME).nes reset.o $(NAME).o asm4c.o nes.lib
	rm *.o

reset.o: reset.s
	$(CA65) reset.s

asm4c.o: asm4c.s
	$(CA65) asm4c.s

screen_utils.s: screen_utils.c


$(NAME).o: $(NAME).s
	$(CA65) $(NAME).s

$(NAME).s: $(NAME).c
	$(CC65) -Oi $(NAME).c --add-source

clean:
	rm $(NAME).nes
