(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./assemblyscript", "./createGenericTypeParameter"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var assemblyscript_1 = require("./assemblyscript");
    var createGenericTypeParameter_1 = require("./createGenericTypeParameter");
    /**
     * This method creates a single FunctionDeclaration that allows Reflect.equals
     * to validate normal class member values.
     *
     * @param {ClassDeclaration} classDeclaration - The class that requires a new function.
     */
    function createStrictEqualsMember(classDeclaration) {
        var range = classDeclaration.name.range;
        // __aspectStrictEquals(ref: T, stackA: usize[], stackB: usize[]): bool
        return assemblyscript_1.TypeNode.createMethodDeclaration(assemblyscript_1.TypeNode.createIdentifierExpression("__aspectStrictEquals", range), [assemblyscript_1.TypeNode.createTypeParameter(assemblyscript_1.TypeNode.createIdentifierExpression("T", range), null, null, range)], assemblyscript_1.TypeNode.createFunctionType([
            // ref: T,
            createDefaultParameter("ref", createGenericTypeParameter_1.createGenericTypeParameter("T", range), range),
            // stack: usize[]
            createDefaultParameter("stack", createUsizeArrayType(range), range),
            // cache: usize[]
            createDefaultParameter("cache", createUsizeArrayType(range), range),
        ], 
        // : bool
        createSimpleNamedType("bool", range), null, false, range), createStrictEqualsFunctionBody(classDeclaration), null, assemblyscript_1.CommonFlags.PUBLIC | assemblyscript_1.CommonFlags.INSTANCE | assemblyscript_1.CommonFlags.GENERIC | (classDeclaration.isGeneric ? assemblyscript_1.CommonFlags.GENERIC_CONTEXT : 0), range);
    }
    exports.createStrictEqualsMember = createStrictEqualsMember;
    /**
     * This method creates a simple name type with the given name and source range.
     *
     * @param {string} name - The name of the type.
     * @param {Range} range - The given source range.
     */
    function createSimpleNamedType(name, range) {
        return assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName(name, range), null, false, range);
    }
    /**
     * This method creates an Array<usize> type with the given range.
     *
     * @param {Range} range - The source range.
     */
    function createUsizeArrayType(range) {
        return assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("Array", range), [
            assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("usize", range), null, false, range),
        ], false, range);
    }
    /**
     * This method creates the entire function body for __aspectStrictEquals.
     *
     * @param {ClassDeclaration} classDeclaration - The class declaration.
     */
    function createStrictEqualsFunctionBody(classDeclaration) {
        var body = new Array();
        var range = classDeclaration.name.range;
        // for each field declaration, generate a check
        for (var _i = 0, _a = classDeclaration.members; _i < _a.length; _i++) {
            var member = _a[_i];
            // if it's an instance member, and it isn't marked private or protected
            if (member.is(assemblyscript_1.CommonFlags.INSTANCE) && !member.is(assemblyscript_1.CommonFlags.PRIVATE | assemblyscript_1.CommonFlags.PROTECTED)) {
                switch (member.kind) {
                    // field declarations automatically get added
                    case assemblyscript_1.NodeKind.FIELDDECLARATION: {
                        var fieldDeclaration = member;
                        body.push(createStrictEqualsIfCheck(member.name.text, fieldDeclaration.range));
                        break;
                    }
                    // function declarations can be getters, check the get flag
                    case assemblyscript_1.NodeKind.FUNCTIONDECLARATION: {
                        if (member.is(assemblyscript_1.CommonFlags.GET)) {
                            var functionDeclaration = member;
                            body.push(createStrictEqualsIfCheck(functionDeclaration.name.text, functionDeclaration.range));
                        }
                        break;
                    }
                }
            }
        }
        // return true;
        body.push(assemblyscript_1.TypeNode.createReturnStatement(assemblyscript_1.TypeNode.createTrueExpression(range), range));
        return assemblyscript_1.TypeNode.createBlockStatement(body, range);
    }
    /**
     * This function generates a single IfStatement with a nested ReturnStatement
     * to validate a nested property on a given class.
     *
     * @param {string} name - The name of the property.
     * @param {Range} range - The source range for the given property.
     */
    function createStrictEqualsIfCheck(name, range) {
        // if (Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH) return false;
        return assemblyscript_1.TypeNode.createIfStatement(
        // Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH
        assemblyscript_1.TypeNode.createBinaryExpression(assemblyscript_1.Token.EQUALS_EQUALS_EQUALS, 
        // Reflect.equals(this.prop, ref.prop, stack, cache)
        assemblyscript_1.TypeNode.createCallExpression(
        // Reflect.equals
        createPropertyAccess("Reflect", "equals", range), null, // types can be inferred by the compiler!
        // arguments
        [
            // this.prop
            assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createThisExpression(range), assemblyscript_1.TypeNode.createIdentifierExpression(name, range), range),
            // ref.prop
            createPropertyAccess("ref", name, range),
            // stack
            assemblyscript_1.TypeNode.createIdentifierExpression("stack", range),
            // cache
            assemblyscript_1.TypeNode.createIdentifierExpression("cache", range),
        ], range), createPropertyAccess("Reflect", "FAILED_MATCH", range), range), 
        // return false;
        assemblyscript_1.TypeNode.createReturnStatement(assemblyscript_1.TypeNode.createFalseExpression(range), range), null, range);
    }
    /**
     * Create a simple default parameter with a name and a type.
     *
     * @param {string} name - The name of the parameter.
     * @param {TypeNode} typeNode - The type of the parameter.
     * @param {Range} range - The source range of the parameter.
     */
    function createDefaultParameter(name, typeNode, range) {
        return assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression(name, range), typeNode, null, assemblyscript_1.ParameterKind.DEFAULT, range);
    }
    /**
     * This method creates a single property access and passes the given range to the AST.
     *
     * @param {string} root - The name of the identifier representing the root.
     * @param {string} property - The name of the identifier representing the property.
     * @param {Range} range - The range of the property access.
     */
    function createPropertyAccess(root, property, range) {
        // root.property
        return assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression(root, range), assemblyscript_1.TypeNode.createIdentifierExpression(property, range), range);
    }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY3JlYXRlU3RyaWN0RXF1YWxzTWVtYmVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3RyYW5zZm9ybS9jcmVhdGVTdHJpY3RFcXVhbHNNZW1iZXIudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFBQSxtREFlMEI7SUFDMUIsMkVBQTBFO0lBRTFFOzs7OztPQUtHO0lBQ0gsU0FBZ0Isd0JBQXdCLENBQUMsZ0JBQWtDO1FBQ3pFLElBQU0sS0FBSyxHQUFHLGdCQUFnQixDQUFDLElBQUksQ0FBQyxLQUFLLENBQUM7UUFFMUMsdUVBQXVFO1FBQ3ZFLE9BQU8seUJBQVEsQ0FBQyx1QkFBdUIsQ0FDckMseUJBQVEsQ0FBQywwQkFBMEIsQ0FBQyxzQkFBc0IsRUFBRSxLQUFLLENBQUMsRUFDbEUsQ0FBQyx5QkFBUSxDQUFDLG1CQUFtQixDQUMzQix5QkFBUSxDQUFDLDBCQUEwQixDQUFDLEdBQUcsRUFBRSxLQUFLLENBQUMsRUFDL0MsSUFBSSxFQUNKLElBQUksRUFDSixLQUFLLENBQ04sQ0FBQyxFQUNGLHlCQUFRLENBQUMsa0JBQWtCLENBQ3pCO1lBQ0UsVUFBVTtZQUNWLHNCQUFzQixDQUFDLEtBQUssRUFBRSx1REFBMEIsQ0FBQyxHQUFHLEVBQUUsS0FBSyxDQUFDLEVBQUUsS0FBSyxDQUFDO1lBQzVFLGlCQUFpQjtZQUNqQixzQkFBc0IsQ0FBQyxPQUFPLEVBQUUsb0JBQW9CLENBQUMsS0FBSyxDQUFDLEVBQUUsS0FBSyxDQUFDO1lBQ25FLGlCQUFpQjtZQUNqQixzQkFBc0IsQ0FBQyxPQUFPLEVBQUUsb0JBQW9CLENBQUMsS0FBSyxDQUFDLEVBQUUsS0FBSyxDQUFDO1NBQ3BFO1FBQ0QsU0FBUztRQUNULHFCQUFxQixDQUFDLE1BQU0sRUFBRSxLQUFLLENBQUMsRUFDcEMsSUFBSSxFQUNKLEtBQUssRUFDTCxLQUFLLENBQ04sRUFDRCw4QkFBOEIsQ0FBQyxnQkFBZ0IsQ0FBQyxFQUNoRCxJQUFJLEVBQ0os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