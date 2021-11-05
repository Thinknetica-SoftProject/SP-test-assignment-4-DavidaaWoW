## Задача №4:
#
# В соседнем районе рождественские эльфы готовят подарки для жителей города.
# Для каждого подарка (файл data/4.txt) нужно найти сколько оберточной бумаги потребуется.
# Формула рассчета: 2*ш*д + 2*д*в + 2*в*ш + площадь наименьшей стороны
# Например, на подарок размером 2х3х4 требуется 2*6 + 2*12 + 2*8 = 52 + 6 кв. см.
#
# Сколько всего оберточной бумаги нужно купить эльфам?
#
## Требования к решению:
# - Входные данные находятся в файле data/4.txt
# - В значениях данные длины, ширины и высоты не упорядочены и могут идти в любом порядке, однако
# длина всегда наименьшее число из трех, высота - среднее, ширина - самое большое.
# - Результат должен быть выведен в консоль командой puts
#
#
## Решение:

str = IO.read("data/4.txt")

result = 0
a = 0

while true
    counter = 0
    dimensions = Array.new(3)
    lowest = Array.new(2)
    while true
        num = ""
        while str[a]!="x" && str[a]!="\n"
            num+=str[a]
            a+=1
        end
        dimensions[counter] = num.to_i
        counter += 1
        if(str[a] == "\n")
            break
        end
        a+=1
    end
    result += dimensions[0]*dimensions[1]*2
    result += dimensions[1]*dimensions[2]*2
    result += dimensions[0]*dimensions[2]*2
    min = 9999
    for i in 0..2 do
        if(dimensions[i]<min)
            min = dimensions[i]
        end
    end
    lowest[0] = min
    min = 9999
    for i in 0..2 do
        if(dimensions[i]<min && dimensions[i]!=lowest[0])
            min = dimensions[i]
        end
    end
    lowest[1] = min
    result += lowest[0] * lowest[1]
    a+=1
    if(a>=str.length)
        break
    end
end
puts result