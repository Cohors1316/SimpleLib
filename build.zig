const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const module = b.addModule("SimpleLib", .{
        .root_source_file = .{ .path = "src/root.zig" },
        .target = target,
        .optimize = optimize,
    });
    const unit_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/test.zig" },
        .target = target,
        .optimize = optimize,
    });
    unit_tests.root_module.addImport("SimpleLib", module);
    const run_unit_tests = b.addRunArtifact(unit_tests);
    const test_step = b.step("test", "Run the tests");
    test_step.dependOn(&run_unit_tests.step);
}
