def read_from_text_file(lines):
    with open("python_demofile.txt", "r") as file:
        for line in file.readlines()[-lines:]:
            print(line, end='')


if __name__ == '__main__':
    read_from_text_file(int(input('Lines: ')))
