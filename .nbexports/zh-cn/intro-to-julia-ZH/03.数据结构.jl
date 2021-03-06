
# ------------------------------------------------------------------------------------------
# # 数据结构
#
# 一旦我们开始一次性处理大量数据，采用数组（array）或者字典（dictionaries）这样的数据结构会比单纯依赖普通变量要方便得多。
#
# 要讲到的数据结构：
# 1. 元组 Tuples
# 2. 字典 Dictionaries
# 3. 数组 Arrays
#
# 总的来说，元组和数组都是元素的有序序列（所以可以直接索引元素）。字典和数组都是可变类型。
# 下面进行详细一点的介绍！
# ------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------
# ## 元组 Tuples
#
# 通过用小括号 `( )` 将一个有序集合括起来可以创建一个元组。
#
# 语法：
# ```julia
# (item1, item2, ...)
# ```
# ------------------------------------------------------------------------------------------

myfavoriteanimals = ("penguins", "cats", "sugargliders")

# ------------------------------------------------------------------------------------------
# 我们可以在这个元组里进行索引，
# ------------------------------------------------------------------------------------------

myfavoriteanimals[1]

# ------------------------------------------------------------------------------------------
# 但因为元组是不可变对象，我们不可以改变它
# ------------------------------------------------------------------------------------------

myfavoriteanimals[1] = "otters"

# ------------------------------------------------------------------------------------------
# ## 命名元组（Named Tuples）
#
# 顾名思义，命名元组 `NamedTuple` 应该和元组 `Tuple` 差不多，
# 只不过每个元素都有名字！命名元组的创建语法是在元组里使用 `=`：
#
# ```julia
# (name1 = item1, name2 = item2, ...)
# ```
# ------------------------------------------------------------------------------------------

myfavoriteanimals = (bird = "penguins", mammal = "cats", marsupial = "sugargliders")

# ------------------------------------------------------------------------------------------
# 就像元组 `Tuples`，命名元组 `NamedTuples` 是有序的，所以也可以通过索引获得元素：
# ------------------------------------------------------------------------------------------

myfavoriteanimals[1]

# ------------------------------------------------------------------------------------------
# 命名元组还有特殊的通过元素名来访问元素的方法：
# ------------------------------------------------------------------------------------------

myfavoriteanimals.bird

# ------------------------------------------------------------------------------------------
# ## 字典 Dictionaries
#
# 如果你的数据集有映射关系，可以考虑使用字典来存储数据。通过 `Dict()` 函数初始化字典，可以为空或者有键值对。
#
# 语法：
# ```julia
# Dict(key1 => value1, key2 => value2, ...)
# ```
#
# 典型的例子如通讯列表，它就是相关联的姓名和电话号码。
# ------------------------------------------------------------------------------------------

myphonebook = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-2368")

# ------------------------------------------------------------------------------------------
# 在这个例子中，每对姓名和号码就是一个键值对。我们可以通过对应的键来获取Jenny的电话号码（值）
# ------------------------------------------------------------------------------------------

myphonebook["Jenny"]

# ------------------------------------------------------------------------------------------
# 我们可以在这字典中继续增加条目
# ------------------------------------------------------------------------------------------

myphonebook["Kramer"] = "555-FILK"

# ------------------------------------------------------------------------------------------
# 来瞧瞧现在这个电话本长什么样：
# ------------------------------------------------------------------------------------------

myphonebook

# ------------------------------------------------------------------------------------------
# 使用 `pop!` 函数可以从通讯列表中删除 Kramer，并同时获得他的电话号码
# ------------------------------------------------------------------------------------------

pop!(myphonebook, "Kramer")

myphonebook

# ------------------------------------------------------------------------------------------
# 与元组和数组不同，字典是无序的。所以不可通过索引获得元素。
# ------------------------------------------------------------------------------------------

myphonebook[1]

# ------------------------------------------------------------------------------------------
# 上面这个例子中，Julia 会认为你想获得键为 `1` 的值。
# ------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------
# ## 数组 Arrays
#
# 不同于元组，数组是可变的。不同于字典，数组是有序的。
#
# 使用方括号 `[ ]` 括起元素集合来创建数组。
#
# 语法：
# ```julia
# [item1, item2, ...]
# ```
#
# 举个例子，我们可以创建一个数组来记录我的好友
# ------------------------------------------------------------------------------------------

myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

# ------------------------------------------------------------------------------------------
# `Array{String,1}` 中的 `1` 表示这是一个一维的向量。
# 一个 `Array{String,2}` 是个二维矩阵，等等。
#
# `Array{String,1}` 中的 `String` 是每个元素的类型。
# ------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------
# 要存储一系列数字的话
# ------------------------------------------------------------------------------------------

fibonacci = [1, 1, 2, 3, 5, 8, 13]

mixture = [1, 1, 2, 3, "Ted", "Robyn"]

# ------------------------------------------------------------------------------------------
# 获得数组后，我们可以通过索引来获得数组中的元素。如，想获得 `myfriends` 中的第三个成员，就可以写成
# ------------------------------------------------------------------------------------------

myfriends[3]

# ------------------------------------------------------------------------------------------
# 我们可以通过索引来修个数组中的元素
# ------------------------------------------------------------------------------------------

myfriends[3] = "Baby Bop"

# ------------------------------------------------------------------------------------------
#  是的，Julia 的索引是从 1 开始的，而不像 Python 是从 0 开始的。
#  这种小问题已经有很多争论了。
#
#  我有个拥有 Solomon 智慧的朋友建议使用从 ½ 开始计数来一劳永逸地解决这个争端。
# ------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------
# 函数 `push!` 和 `pop!` 也可以改变数组。
# `push!` 在数组最后添加元素，而 `pop!` 删除数组的最后一个元素。
#
# 给 `fibonnaci` 添加一个数
# ------------------------------------------------------------------------------------------

push!(fibonacci, 21)

# ------------------------------------------------------------------------------------------
# 再删掉它
# ------------------------------------------------------------------------------------------

pop!(fibonacci)

fibonacci

# ------------------------------------------------------------------------------------------
# 到目前为止，我给的例子都是一维的标量，但其实数组可以有任意个维度、可以包含其他数组。
# <br><br>
# 举个例子，下面这个数组就包含了数组：
# ------------------------------------------------------------------------------------------

favorites = [["koobideh", "chocolate", "eggs"],["penguins", "cats", "sugargliders"]]

numbers = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]

# ------------------------------------------------------------------------------------------
# 下面的例子是包含随机数的二维和三维数组。
# ------------------------------------------------------------------------------------------

rand(4, 3)

rand(4, 3, 2)

# ------------------------------------------------------------------------------------------
# 当你复制数组的时候千万要小心！
# ------------------------------------------------------------------------------------------

fibonacci

somenumbers = fibonacci

somenumbers[1] = 404

fibonacci

# ------------------------------------------------------------------------------------------
# 修改 `somenumbers` 同时也修改了 `fibonacci`！
#
# 在上面那个例子中，实际上我们并没有获得 `fibonacci` 的副本。
# 我们只是创建了一个新的获取 `fibonacci` 所绑定数组的元素的途径。
#
# 如果想获得 `fibonacci` 所绑定数组的副本，可以使用 `copy` 函数。
# ------------------------------------------------------------------------------------------

# 先复原 fibonacci
fibonacci[1] = 1
fibonacci

somemorenumbers = copy(fibonacci)

somemorenumbers[1] = 404

fibonacci

# ------------------------------------------------------------------------------------------
# 上面这个例子中，fibonacci 就没有受影响。
# 因此可以判断 `somemorenumbers` 和 `fibonacci` 所绑定的数组是不同的。
# ------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------
# ## 练习
#
# ### 3.1
# 用下面的代码创建一个数组 `a_ray`：
#
# ```julia
# a_ray = [1, 2, 3]
# ```
#
# 在这个数组的末尾添加数字 `4` 再删掉它。
# ------------------------------------------------------------------------------------------

# 在此作答


@assert a_ray == [1, 2, 3]

# ------------------------------------------------------------------------------------------
# ### 3.2
# 试着通过下面的代码给 `myphonebook` 添加一个键为 "Emergency" 值为 `string(911)` 条目
# ```julia
# myphonebook["Emergency"] = 911
# ```
#
# 为啥不好使呢？
# ------------------------------------------------------------------------------------------

# 在此作答。更正代码以消除错误
myphonebook["Emergency"] = 911

ans = myphonebook["Emergency"]
@assert  ans == "$ans"

# ------------------------------------------------------------------------------------------
# ### 3.3
# 创建一个名为 `flexible_phonebook` 的字典，其中 Jenny 的号码为整型，而 Ghostbusters 的号码为字符串
#
# ```julia
# (Jenny = 8675309, Ghostbusters = 555-2368)
# ```
# ------------------------------------------------------------------------------------------

flexible_phonebook = Dict()

@assert flexible_phonebook == Dict("Jenny" => 8675309, "Ghostbusters" => "555-2368")

# ------------------------------------------------------------------------------------------
# ### 3.4
# 给`flexible_phonebook`添加一个键为"Emergency"值为整数`911`的条目。
# ------------------------------------------------------------------------------------------

# 在此作答


@assert haskey(flexible_phonebook, "Emergency")

@assert flexible_phonebook["Emergency"] == 911

# ------------------------------------------------------------------------------------------
# ### 3.5
# 思考题：为什么`flexible_phonebook`可以添加值为整型的条目而`myphonebook`不行？
# 该如何初始化`myphonebook`才能添加值为整型的条目呢？
# ------------------------------------------------------------------------------------------



# ------------------------------------------------------------------------------------------
# 请在完成练习运行 `@assert` 块以检测结果是否正确，若无报错即为正确。
# ------------------------------------------------------------------------------------------
