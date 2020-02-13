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
    function createStrictEqualsMember(classDeclaration) {
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
        assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("bool", range), null, false, range), null, false, range), createStrictEqualsFunctionBody(classDeclaration), null, assemblyscript_1.CommonFlags.PUBLIC | assemblyscript_1.CommonFlags.INSTANCE | assemblyscript_1.CommonFlags.GENERIC | (classDeclaration.isGeneric ? assemblyscript_1.CommonFlags.GENERIC_CONTEXT : 0), range);
    }
    exports.createStrictEqualsMember = createStrictEqualsMember;
    function createStrictEqualsFunctionBody(classDeclaration) {
        var body = [];
        var range = classDeclaration.name.range;
        // for each field declaration, generate a check
        for (var _i = 0, _a = classDeclaration.members; _i < _a.length; _i++) {
            var member = _a[_i];
            switch (member.kind) {
                case assemblyscript_1.NodeKind.FIELDDECLARATION: {
                    if (member.is(assemblyscript_1.CommonFlags.INSTANCE) && !member.is(assemblyscript_1.CommonFlags.PRIVATE | assemblyscript_1.CommonFlags.PROTECTED)) {
                        var fieldDeclaration = member;
                        body.push(createStrictEqualsIfCheck(member.name.text, fieldDeclaration.range));
                    }
                    break;
                }
                case assemblyscript_1.NodeKind.FUNCTIONDECLARATION: {
                    if (member.is(assemblyscript_1.CommonFlags.PUBLIC | assemblyscript_1.CommonFlags.GET)) {
                        var functionDeclaration = member;
                        body.push(createStrictEqualsIfCheck(functionDeclaration.name.text, functionDeclaration.range));
                    }
                    break;
                }
            }
        }
        // return true
        body.push(assemblyscript_1.TypeNode.createReturnStatement(assemblyscript_1.TypeNode.createTrueExpression(range), range));
        return assemblyscript_1.TypeNode.createBlockStatement(body, range);
    }
    function createStrictEqualsIfCheck(name, range) {
        // if (Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH) return false;
        return assemblyscript_1.TypeNode.createIfStatement(
        // Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH
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
        ], range), assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_1.TypeNode.createIdentifierExpression("FAILED_MATCH", range), range), range), assemblyscript_1.TypeNode.createReturnStatement(assemblyscript_1.TypeNode.createFalseExpression(range), range), null, range);
    }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY3JlYXRlU3RyaWN0RXF1YWxzTWVtYmVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3RyYW5zZm9ybS9jcmVhdGVTdHJpY3RFcXVhbHNNZW1iZXIudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFBQSxpREFhd0I7SUFFeEIsU0FBZ0Isd0JBQXdCLENBQUMsZ0JBQWtDO1FBQ3pFLElBQU0sS0FBSyxHQUFHLGdCQUFnQixDQUFDLElBQUksQ0FBQyxLQUFLLENBQUM7UUFFMUMsdUVBQXVFO1FBQ3ZFLE9BQU8seUJBQVEsQ0FBQyx1QkFBdUIsQ0FDckMseUJBQVEsQ0FBQywwQkFBMEIsQ0FBQyxzQkFBc0IsRUFBRSxLQUFLLENBQUMsRUFDbEUsQ0FBQyx5QkFBUSxDQUFDLG1CQUFtQixDQUMzQix5QkFBUSxDQUFDLDBCQUEwQixDQUFDLEdBQUcsRUFBRSxLQUFLLENBQUMsRUFDL0MsSUFBSSxFQUNKLElBQUksRUFDSixLQUFLLENBQ04sQ0FBQyxFQUNGLHlCQUFRLENBQUMsa0JBQWtCLENBQ3pCO1lBQ0UsVUFBVTtZQUNWLHlCQUFRLENBQUMsZUFBZSxDQUN0Qix5QkFBUSxDQUFDLDBCQUEwQixDQUFDLEtBQUssRUFBRSxLQUFLLENBQUMsRUFDakQseUJBQVEsQ0FBQyxlQUFlLENBQ3RCLHlCQUFRLENBQUMsb0JBQW9CLENBQUMsR0FBRyxFQUFFLEtBQUssQ0FBQyxFQUN6QyxJQUFJLEVBQ0osS0FBSyxFQUNMLEtBQUssQ0FDTixFQUNELElBQUksRUFDSiw4QkFBYSxDQUFDLE9BQU8sRUFDckIsS0FBSyxDQUNOO1lBQ0QsaUJBQWlCO1lBQ2pCLHlCQUFRLENBQUMsZUFBZSxDQUN0Qix5QkFBUSxDQUFDLDBCQUEwQixDQUFDLE9BQU8sRUFBRSxLQUFLLENBQUM7WUFDbkQsZUFBZTtZQUNmLHlCQUFRLENBQUMsZUFBZSxDQUN0Qix5QkFBUSxDQUFDLG9CQUFvQixDQUFDLE9BQU8sRUFBRSxLQUFLLENBQUMsRUFD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