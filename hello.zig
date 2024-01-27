const std = @import("std");

fn hail(comptime start: u64) u64 {
    var current = start;
    var count: u64 = 0;

    while (true) {
        count += 1;
        if (current % 2 == 0) {
            current = current / 2;
        } else if (current != 1) {
            current = (current * 3) + 1;
        } else {
            break;
        }
    }

    return count;
}

pub fn main() void {
    //var winner: u64 = 0;

    const the_result = comptime init: {
        var highest: u64 = 0;
        //for (1..100_000_000) |i| {

        @setEvalBranchQuota(100_000_000);

        inline for (1..100_000) |i| {
            const count = hail(i);
            if (count > highest) {
                highest = count;
                //winner = i;
            }
        }
        break :init highest;
    };
    std.debug.print("{}\n", .{the_result});
}
