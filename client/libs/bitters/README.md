##Bitters - Meteor Smart Package

This is a simple port of [Bitters](https://github.com/thoughtbot/bitters) to meteor.

###How to use

1. Install [meteorite](https://github.com/oortcloud/meteorite)
2. `mrt add scss`
3. `mrt add bourbon`
4. `mrt add neat`
5. `mrt add bitters`
6. Include the following in your main scss file

	@import "packages/bourbon/bourbon";
   @import "packages/bitters/base";
	@import "packages/neat/neat";

7. `@include` neat's classes as you see fit !
