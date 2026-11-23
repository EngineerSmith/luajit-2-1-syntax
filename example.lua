-- Reference https://luajit.org/extensions.html#lj30_bp_syntax

-- Safe Navigation & Nil-Coalescing
local user = {
  profile = { age = 1e-4 + 0b10101 , greeting = "Hello World" },
  greet = function() end,
}
assert((user?.profile?.age ?? 18) == 21.0001)
assert((user?.["settings"]?.theme ?? "dark") == "dark")

local _ = user?.profile?.greeting, user.profile.greeting
local _ = user:greet()
local _ = user?.greet(user)
local _ = user?.:greet?.()

-- Ternary Operator
local status = (user.profile.age >= 18) ? "adult" : "minor"
assert(status == "adult")

-- Lambdas |params| -> expr
local add = |a, b| -> a + b
local square = |x| -> x * x
assert(add(3, square(4)) == 19)

-- const scoping
const MAX_RETRIES = 3
-- MAX_RETRIES = 5 -- throws error

-- Compound Assignments
local score = 10
score += 5
score *= 2
local label = "Score: "
label ..= score
assert(label == "Score: 30") 

-- continue Statement in Loops
local sum = 0
for i = 1, 5 do
  if i == 3 then continue end
  if false then break end
  sum += i
end
goto continue
::continue:: -- goto label
assert(sum == 12)

-- Bitwise Operator - jit's bit.* library
local flags = (1 << 2) | (1 << 0) -- 5 (0b101)
assert((flags & 4) != 0)
assert((~0) == -1)
assert((-16 >> 2) == 1073741820)
assert((-16 ~>> 2) == -4)
assert((-1 >> 28) == 15)

-- c-style Operators
local a, b = true, false
if !b && (a || b) && (1 != 2) then
  assert(true)
end

-- Library functions
jit.on()
jit?.on()
_G?.jit.on()

math.floor(0)
math?.floor(0)
_G?.math.floor(0)

-- Underscore separators
local million = 1_000_000
local hex_color = 0xFF_00_80
local binary = 0b1010_0101
assert(million == 1000000 and hex_color == 0xFF0080 and binary == 165)

local binaryLong = 0b1010_0101ULL
local long = 191919ULL
local hexIsFull = 0xFull
local foo = 1_000e3 + 1e+6

-- Not backported to 2.1:

-- Floor division
-- assert(1 // 3 == 0)

-- Named vararg
-- local func
-- func = function(a, ...var)
--   print(a)
--   if var.n ~= 0 then func(var) end
-- end
