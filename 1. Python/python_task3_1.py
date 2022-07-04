from random import random


def generate_text_file(lines):
    with open("python_demofile.txt", "w") as file:
        for i in range(lines):
            file.write(str(random()))
            file.write("\n")
    print('ready')


if __name__ == '__main__':
    generate_text_file(int(input('Lines: ')))
