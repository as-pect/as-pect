(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "assemblyscript"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var assemblyscript_1 = require("assemblyscript");
    function createMember(classDeclaration) {
        var range = classDeclaration.name.range;
        // __aspectStrictEquals(ref: T, stackA: usize[], stackB: usize[]): bool
        return assemblyscript_1.TypeNode.createMethodDeclaration(assemblyscript_1.TypeNode.createIdentifierExpression("__aspectStrictEquals", range), [assemblyscript_1.TypeNode.createTypeParameter(assemblyscript_1.TypeNode.createIdentifierExpression("T", range), null, null, range)], assemblyscript_1.TypeNode.createFunctionType([
            // ref: T,
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("ref", range), assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("T", range), null, false, range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
            // stack: usize[]
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("stack", range), 
            // Array<usize>
            assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("Array", range), [assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("usize", range), null, false, range)], false, range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
            // cache: usize[]
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("cache", range), assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("Array", range), [
                assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("usize", range), null, false, range),
            ], false, range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
        ], 
        // : bool
        assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("bool", range), null, false, range), null, false, range), createFunctionBody(classDeclaration), null, assemblyscript_1.CommonFlags.PUBLIC | assemblyscript_1.CommonFlags.INSTANCE | assemblyscript_1.CommonFlags.GENERIC | (classDeclaration.isGeneric ? assemblyscript_1.CommonFlags.GENERIC_CONTEXT : 0), range);
    }
    exports.createMember = createMember;
    function createFunctionBody(classDeclaration) {
        var body = [];
        var range = classDeclaration.name.range;
        // for each field declaration, generate a check
        for (var _i = 0, _a = classDeclaration.members; _i < _a.length; _i++) {
            var member = _a[_i];
            switch (member.kind) {
                case assemblyscript_1.NodeKind.FIELDDECLARATION: {
                    if (member.is(assemblyscript_1.CommonFlags.INSTANCE) && !member.is(assemblyscript_1.CommonFlags.PRIVATE | assemblyscript_1.CommonFlags.PROTECTED)) {
                        var fieldDeclaration = member;
                        body.push(createIfCheck(member.name.text, fieldDeclaration.range));
                    }
                    break;
                }
                case assemblyscript_1.NodeKind.FUNCTIONDECLARATION: {
                    if (member.is(assemblyscript_1.CommonFlags.PUBLIC | assemblyscript_1.CommonFlags.GET)) {
                        var functionDeclaration = member;
                        body.push(createIfCheck(functionDeclaration.name.text, functionDeclaration.range));
                    }
                    break;
                }
            }
        }
        // return true
        body.push(assemblyscript_1.TypeNode.createReturnStatement(assemblyscript_1.TypeNode.createTrueExpression(range), range));
        return assemblyscript_1.TypeNode.createBlockStatement(body, range);
    }
    function createIfCheck(name, range) {
        // if (Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAIL) return false;
        return assemblyscript_1.TypeNode.createIfStatement(
        // Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAIL
        assemblyscript_1.TypeNode.createBinaryExpression(assemblyscript_1.Token.EQUALS_EQUALS_EQUALS, 
        // Reflect.equals(this.prop, ref.prop, stack, cache)
        assemblyscript_1.TypeNode.createCallExpression(assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_1.TypeNode.createIdentifierExpression("equals", range), range), null, // types can be inferred by the compiler!
        // arguments
        [
            // this.prop
            assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createThisExpression(range), assemblyscript_1.TypeNode.createIdentifierExpression(name, range), range),
            // ref.prop
            assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("ref", range), assemblyscript_1.TypeNode.createIdentifierExpression(name, range), range),
            // stack
            assemblyscript_1.TypeNode.createIdentifierExpression("stack", range),
            // cache
            assemblyscript_1.TypeNode.createIdentifierExpression("cache", range),
        ], range), assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_1.TypeNode.createIdentifierExpression("FAIL", range), range), range), assemblyscript_1.TypeNode.createReturnStatement(assemblyscript_1.TypeNode.createFalseExpression(range), range), null, range);
    }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY3JlYXRlTWVtYmVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3RyYW5zZm9ybS9jcmVhdGVNZW1iZXIudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFBQSxpREFhd0I7SUFFeEIsU0FBZ0IsWUFBWSxDQUFDLGdCQUFrQztRQUM3RCxJQUFNLEtBQUssR0FBRyxnQkFBZ0IsQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDO1FBRTFDLHVFQUF1RTtRQUN2RSxPQUFPLHlCQUFRLENBQUMsdUJBQXVCLENBQ3JDLHlCQUFRLENBQUMsMEJBQTBCLENBQUMsc0JBQXNCLEVBQUUsS0FBSyxDQUFDLEVBQ2xFLENBQUMseUJBQVEsQ0FBQyxtQkFBbUIsQ0FDM0IseUJBQVEsQ0FBQywwQkFBMEIsQ0FBQyxHQUFHLEVBQUUsS0FBSyxDQUFDLEVBQy9DLElBQUksRUFDSixJQUFJLEVBQ0osS0FBSyxDQUNOLENBQUMsRUFDRix5QkFBUSxDQUFDLGtCQUFrQixDQUN6QjtZQUNFLFVBQVU7WUFDVix5QkFBUSxDQUFDLGVBQWUsQ0FDdEIseUJBQVEsQ0FBQywwQkFBMEIsQ0FBQyxLQUFLLEVBQUUsS0FBSyxDQUFDLEVBQ2pELHlCQUFRLENBQUMsZUFBZSxDQUN0Qix5QkFBUSxDQUFDLG9CQUFvQixDQUFDLEdBQUcsRUFBRSxLQUFLLENBQUMsRUFDekMsSUFBSSxFQUNKLEtBQUssRUFDTCxLQUFLLENBQ04sRUFDRCxJQUFJLEVBQ0osOEJBQWEsQ0FBQyxPQUFPLEVBQ3JCLEtBQUssQ0FDTjtZQUNELGlCQUFpQjtZQUNqQix5QkFBUSxDQUFDLGVBQWUsQ0FDdEIseUJBQVEsQ0FBQywwQkFBMEIsQ0FBQyxPQUFPLEVBQUUsS0FBSyxDQUFDO1lBQ25ELGVBQWU7WUFDZix5QkFBUSxDQUFDLGVBQWUsQ0FDdEIseUJBQVEsQ0FBQyxvQkFBb0IsQ0FBQyxPQUFPLEVBQUUsS0FBSyxDQUFDLEVBQzdDLENBQUMseUJBQVEsQ0FBQyxlQUFlLENB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