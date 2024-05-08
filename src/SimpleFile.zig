words: []const u8 = "Hello, World!",

pub fn printStuff(self: *Self) void {
    std.debug.print("{s}", .{self.words});
}

pub fn getStuff(self: *Self) []const u8 {
    return self.words;
}

const Self = @This();
const std = @import("std");