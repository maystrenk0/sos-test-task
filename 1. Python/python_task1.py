def is_palindrome(string1, string2):
    str_to_list1 = list(string1)
    str_to_list2 = list(string2)
    str_to_list1.sort()
    str_to_list2.sort()
    return str_to_list1 == str_to_list2


if __name__ == '__main__':
    for i in range(3):
        print(is_palindrome(input('First string: '), input('Second string: ')))
