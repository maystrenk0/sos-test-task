def compress_string(string):
    str_to_list = list(string)
    result = ''
    tmp_char = str_to_list[0]
    tmp_count = 0
    for i in range(len(str_to_list)):
        if str_to_list[i] == tmp_char:
            tmp_count += 1
            if i == len(str_to_list) - 1:
                result += tmp_char
                result += str(tmp_count)
        else:
            result += tmp_char
            result += str(tmp_count)
            tmp_char = str_to_list[i]
            tmp_count = 1
    return result if len(result) < len(string) else string


if __name__ == '__main__':
    print(compress_string(input('String: ')))
