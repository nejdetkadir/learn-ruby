# Eğer a'nın değeri 5'ten büyükse ekrana "Merhaba" yaz
puts "Hello World!" if 6 > 5

# Method tanımladık
def greet_user(username)
    puts "Hello #{username}!"
end

# Diğer dillerden farklı olarak, Ruby'de fonksiyon (method) çağırırken parantez kullanmak zorunluğu yoktur.
greet_user("Nejdet")
greet_user "Kadir"

def greet_user_two(username)
    "Hello #{username}"
end

# Pek çok dilde, fonksiyon eğer bir şey dönerse geriye, mutlaka return komutu kullanılır. Ruby'de buna da gerek yok. Çünkü her method (yani Fonksiyon) mutlaka default olarak bir şey döner. Hiçbir şey dönmese bile nil döner.
puts greet_user_two "Nejdet Kadir"

# Bu satır line-comment, yani tek satırlı yorum

=begin
Bu yorum...
Bu da yorum...
Hatta bu da...
=end

# Ruby Duck Typing şeklinde çalışır. Yani atama yapmadan önce ne tür bir değer ataması yapacağımızı belirtmemize gerek yok.
user_name = "Nejdet Kadir"
user_age = 20

# String içinde değişken kullanımı yaptığımız zaman yani;
puts "Name : #{user_name} | Age : #{user_age}"

# $ işaretiyle başlayan tüm değişkenler Global değişkenlerdir. Kodun herhangi bir yerinde kullanılabilir ve erişilebilir.
$today = "Monday"

def greet_user_three(username)
    puts "Helloo #{username}, today is #{$today}"
end

greet_user_three(user_name)

# Sabit nedir? Değiştirelemeyendir. Yani bu tür değişkenler, ki bu değişken değildir, sabit olarak adlandırılır. Kural olarak mutlaka BÜYÜK HARF'le başlar! Bazen de tamamen büyük harflerden oluşur.
MY_AGE = 20
your_age = 21

puts defined?(MY_AGE)
puts defined?(your_age)

# Ruby'de ilginç bir durum daha var. Constant'lar mutable yani değiştirilebilir.
puts defined?(MY_AGE)
puts "My age : #{MY_AGE}"

MY_AGE = 22
puts defined?(MY_AGE)
puts "My age : #{MY_AGE}"

# ama warning yani uyarı mesajı aldık!

# warning: already initialized constant MY_AGE
# warning: previous definition of MY_AGE was here

# Paralel atama
x, y, z = "Nejdet", 25.12, 94
puts "x, y, z = #{x}, #{y}, #{z}"

# Instance Variable
# Instance dediğimiz şey Class'dan türemiş olan nesnedir. Bu konuyu detaylı olarak ileride inceleyeceğiz. Sadece ön bilgi olması adına değiniyorum. @ işareti ile başlarlar.
class User
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  
  def greet
    "Hellooo #{@name}"
  end
end

user = User.new("nejdetkadirr")
puts user.greet
puts user.name

# Class Variable
# Class'a ait değişkendir. Dikkat edin burada türeyen birşey yok. @@ ile başlar. Kullanmadan önce bu değişkeni mutlaka init etmelisiniz
class User 
  attr_accessor :name
  @@instance_count = 0
  def initialize(name)
    @name = name
    @@instance_count += 1
  end

  def greet
    "Hellooo #{@name}"
  end

  def self.instance_count # burası önemli
    @@instance_count
  end
end

user1 = User.new("Uğur")
user2 = User.new("Ezel")
user3 = User.new("Yeşim")
puts "Kaç defa User instance'ı oldu => #{User.instance_count}"

a = []
puts a.class
puts a.length
a.[]=5, "GITHUB"
p a

# Unary Operatörleri
# Unary demek, += , -= , *= gibi işlemleri yaptığımız operatörler.
str = "Hello World!"

class String
  def -@
    reverse
  end
end

p str
p -str