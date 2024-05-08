path: []const u8,
config: Config = .{},
private: Private = .{},

pub const Config = struct {
    baud_rate: BaudRate = switch (builtin.os.tag) {
        .windows => 9600,
        else => .B9600,
    },
    parity: Parity = .none,
    word_size: WordSize = .eight,
    stop_bits: StopBits = .one,
    handshake: Handshake = .none,
};

pub const BaudRate = switch (builtin.os.tag) {
    .windows => u32,
    else => std.c.speed_t,
};

pub const Parity = enum {
    none,
    odd,
    even,
    mark,
    space,
};

pub const WordSize = enum {
    five,
    six,
    seven,
    eight,
};

pub const StopBits = enum {
    one,
    two,
};

pub const Handshake = enum {
    none,
    software,
    hardware,
};

pub fn init(name: []const u8, config: Config) !SerialPort {
    return .{
        .path = name,
        .config = config,
        .private = .{},
    };
}
pub fn open(self: *SerialPort) !void {
    self.private.file = try std.fs.cwd().openFile(self.path, .{ .mode = .read_write });
    self.configure(); 
}
const SerialPort = @This();
const std = @import("std");
const builtin = @import("builtin");
const testing = std.testing;

fn configure(self: *SerialPort) void {
    self.private.file;
}

const Private = struct {
    file: std.fs.File = undefined,
};
