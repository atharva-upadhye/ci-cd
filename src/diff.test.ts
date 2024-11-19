import { expect, test } from "vitest";
import { diff } from "./diff";

test("6 - 3 to equal 3", () => {
	expect(diff(6, 3)).toBe(3);
});

test("1 - 8 to equal -7", () => {
	expect(diff(1, 8)).toBe(-7);
});
