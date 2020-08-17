# Methods (Fonksiyonlar)
# Ruby'de herşey mutlaka geriye birşey döner. Ne demek bu? Prensip olarak method’lar zincir olarak çalıştığı için, method denen şey de aslında bir fonksiyon ve fonksiyon denen şey de bir dizi işlemin yapılıp geriye sonucun dönüldüğü bir taşıyıcı.
def hello_one
  m = "a"
  n = "b"
end

def hello_two
  m = "a"
  n = "b"
  return "x y"
end

puts hello_one
puts hello_two

# def ile tanımlanan method’u, undef ile yok edebilirsiniz.
def say_hello
  puts "HELLOOOO"
end

say_hello
# undef say_hello
# say_hello

def write_day(day)
  "today is #{day}"
end

def write_day_two day
  "today is #{day}"
end

puts write_day("Sunday")
puts write_day "Friday"
puts write_day_two "Monday"

# Bazı durumlara, argüman alan method çağırırken, argümanın tipine göre, eğer parantez kullanmadan çağırma yaparsanız warning alabilirsiniz!
# Method Conventions

# Eğer bir method’un son karakteri ? ise bu o method’un true ya da false yani Boolean bir değer döneceğini ifade eder.
a = "ali"
b = "ali"

puts a.eql? b
puts a.eql?(b)

# Eğer method’un son karakteri ! (Ünlem) ise; bu, o method’un tehlikeli bir iş yaptığını anlatır. Yani ilgili nesnenin kopyalanmadan direk üzerinde değişiklik yapacağı anlamına gelir.
puts a.upcase
puts a

puts a.upcase!
puts a

# Default Arguments
def are_u_okey(status="Good")
  "I'm #{status}."
end

puts are_u_okey
puts are_u_okey "so good"

# Variable-Length Arguments
# Bazı durumlarda method’a değişken sayıda olarak parametre geçmek gerekebilir. Bu durumda argümanın başına * işareti gelir. Bu sayede o argüman artık bir dizi (Array) haline gelir.

def say_your_friends(*names)
  "My friends are #{names.join(" and ")}."
end

puts say_your_friends "Fatih", "Yiğit", "Samet", "Doğukan"

# Bir başka kullanım şekli ise
def custom_numbers(first, second, *others)
  puts "first num: #{first}"
  puts "second num : #{second}"
  puts "others nums : #{others.join(", ")}"
end

custom_numbers 5,15,123,321,456,987

# Aliasing (Method’a Takma İsim Vermek)
alias say_fri say_your_friends
puts say_fri "x", "y", "z"

=begin

UNUTMA!
- return kullanmadan method’dan geri dönüş yapılabilir
- Parantez kullanmadan method tanımlanabilir
- Parantez kullanmadan method çağırılıp parametre geçilebilir.
- ? ile biten method mutlaka true ya da false döner.
- ! ile biten orijinal değeri mutlaka değiştirir.
- = ile biten setter'dır. 

=end

# Blocks
family_members = ["Yeşim", "Ezel", "Uğur", "Ömer"]

family_members.each do |mem_name|
  puts mem_name
end

# Aynısı
family_members.each { |mem_name| puts mem_name }

# yield
def test_function
  yield
end

test_function {
  puts "Hi"
}

test_function do
  puts "I'am in the block"
end

test_function do
  [1, 2, 3, 4].each do |n|
    puts "num:  #{n}"
  end
end

=begin

test_function adında bir fonksiyonum var (yani method’um var) Hiç parametre almıyor!
ama Block alıyor. İlkinde curly brace ile (yani { ve } ), ikincisinde do/end ile, son
örnekte do/end ile ve iç kısımda başka bir iterasyonla kullandım.
Kabaca, fonksiyona kod bloğu geçtim.

=end

def test_function
  if block_given?
    yield
  else
    puts "Please give me a block!"
  end
end

test_function

def numerator
  yield 10
  yield 4
  yield 8
end

numerator do |num|
  puts "Called num is => #{num}"
end

def print_users
  ["Uğur", "Yeşim", "Ezel"].each do |name|
    yield name
  end
end

print_users do |name|
  puts "user name : #{name}"
end

# Fonksiyon içine fonksiyon geçtik gibi.
10.times {
  puts "Merhaba"
}
# Aslında times sayılara ait bir method ve yukarıdaki örneklerde gördüğünüz gibi blok geçebiliyoruz kendisine.

# Proc ve Lambda
def multiplier(with)
  return Proc.new {|number| number * with }
end

multiply_with_5 = multiplier(5)
puts multiply_with_5.class

puts multiply_with_5.call(10)

# Bu kadar kasmadan, basit bir method ile yapsaydık
def multiplier(number, with)
  return number * with
end

puts multiplier 10,7

multiplier = Proc.new { |*number|
  number.collect { |n| n ** 2 }
}

puts multiplier.call(1) 
puts multiplier.call(2,4,6)
puts multiplier[2,4,6].class
# Az ileride Array konusunda göreceğimiz collect method'unu kullandık. Bu method ile Array'in her elemanını okuyor ve karesini n ** 2 alıyoruz. * işareti yine Array'de göreceğimiz splat özelliği. Yani geçilen parametre grubunu Array olarak değerlendir diyoruz.

# Conditional Statements
a = 5
b = 10

# Çoklu kontrollerde && veya and kullanabiliriz.

if a == 5 && b == 10
  puts "thats all true"
end
# Eğer, a, 5'e eşitse Merhaba Yaz demek için ilk akla gelen yöntem

if a == 5
  puts "Hello"
end
# ama bunu çok daha basit hale getirebiliriz:
puts "Helloo" if a == 5

# unless, aslında if in tersi gibi. Daha doğrusu if not anlamında. Eğer a, b'ye eşit değilse demek için kullanılır.
unless a == b
  puts "#{a} is not equal to #{b}"
end

# Döngüler

i = 0
while i < 5 do
  puts "i = #{i}"
  # break if i == 3
  i += 1
end

# Aynı unless mantığında, until kullanılır loop'larda. Yani i 10'a eşit olmadığı sürece bu loop çalışır.
i = 0
until i == 10 do
  puts "i = #{i}"
  i += 1
end

# case , when Yapısı
computer = "c64"
year = case computer
  when "c64" then "1982"
  when "c16" then "1984"
  when "amiga" then "1985"
  else
  "Tarih bilinmiyor"
end
puts "#{computer} çıkış yılı #{year}"

# Yukarıdaki kodu bir ton if , elsif ile yapmak yerine, when ve then ile daha anlaşılır hale getirdiğimizi düşünüyorum. when kullanırken range (aralık) belirmesi de yapma şansı var.
student_grade = 8
case student_grade
when 0
  puts "Bad"
when 1..4
  puts "unsuccessful"
when 5..7
  puts "Good"
when 8..9
  puts "So Good"
when 10
  puts "Perfect"
end

# Eğer not 1 ile 4 aralığındaysa (ve dahil ise) ya da 5 ile 7 aralığındaysa gibi bir kontrol ekledik.

for i in 1..10
  puts "i = #{i}"
end

# Ternary Operatörü
# Kısaltılmış if yapısıdır. Hemen hemen pek çok dilde kullanılan, Eğer şu doğru ise bu değilse bu ifadesi için kullanılır.
amount = 2
pluralize = amount == 1 ? "apple" : "apples"
puts "#{amount} #{pluralize}."

# BEGIN ve END
# Ruby'de ilginç bir özellik de, kodun çalışmasından önceye ve sonraya bir ek takabiliyoruz. Aşağıdaki örnekte BEGIN block'undaki kodlar program başladığında, END block'undaki kodlar program bitmeden hemen önce çalışacaktır.
BEGIN { puts "start time #{Time.now.to_s}" }
END { puts "end time #{Time.now.to_s}" }

def say_hello(username)
"Merhaba #{username}"
end

puts say_hello "ŞEVVAL"
sleep 5