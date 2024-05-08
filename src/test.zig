const std = @import("std");
const SimpleLib = @import("SimpleLib");


test "SimpleLib" {
    const sl = SimpleLib{};
    std.testing.expectEqualStrings("Hello, World!", sl.getStuff());
}