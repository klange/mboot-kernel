unsigned short * vga_text = (unsigned short *)0xB8000;
char msg[] = "Welcome to YelpOS!";

void kernel_main() {
	char * i = msg;
	unsigned short * c = vga_text;
	while (*i != 0) {
		*c = (*i | (15 | (0 << 4)) << 8);
		i++;
		c++;
	}
}
