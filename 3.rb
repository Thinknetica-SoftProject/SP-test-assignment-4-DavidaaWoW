## Задача №3:
#
# Джон добрался до этажа с бомбой, но у него на пути стоит дверь с кодовым замком и рядом бумажка с инструкциями (файл data/3.txt)
#
# Чтобы узнать код от замка, ему нужно для каждой строки найти разницу между наибольшим и наименьшим числами и потом сложить полученные значения
#
## Требования к решению:
# - Входные данные находятся в файле data/3.txt (разделитель значений - символ табуляции)
# - Результат должен быть выведен в консоль командой puts
#
## Решение:

str = IO.read("data/3.txt")
result = 0
c = 0
d = 0
while d<=str.length
    max_num = 0
    min_num = 9999
    for b in 0..str.length do
        num = ""
        for a in c..str.length do
            c+=1
            if(str[a] == "\t" || str[a] == "\n")
                break
            end
            d+=1
            num+=str[a]
        end
        if(num.to_i < min_num)
            min_num = num.to_i
        end
        if(num.to_i > max_num)
            max_num = num.to_i
        end
        if(str[d]) == "\n"
            break
        end
        d+=1
    end
    d+=1
    result += max_num-min_num
    if d>=str.length
        break
    end
end
puts result