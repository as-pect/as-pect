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
    function createAddHostValueKeyValuePairsMember(classDeclaration) {
        var range = classDeclaration.name.range;
        // __aspectAddHostValueKeyValuePairs(hostObject: i32, seen: Map<usize, i32>): void
        return assemblyscript_1.TypeNode.createMethodDeclaration(assemblyscript_1.TypeNode.createIdentifierExpression("__aspectAddHostValueKeyValuePairs", range), null, assemblyscript_1.TypeNode.createFunctionType([
            // hostObject: i32
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("hostObject", range), createGenericTypeParameter_1.createGenericTypeParameter("i32", range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
            // seen: Map<usize, i32>
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("seen", range), assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("Map", range), [
                createGenericTypeParameter_1.createGenericTypeParameter("usize", range),
                createGenericTypeParameter_1.createGenericTypeParameter("i32", range),
            ], false, range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
        ], assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("void", range), [], false, range), null, false, range), createAddHostValueKeyValuePairsFunctionBody(classDeclaration), null, assemblyscript_1.CommonFlags.PUBLIC |
            assemblyscript_1.CommonFlags.INSTANCE |
            (classDeclaration.isGeneric ? assemblyscript_1.CommonFlags.GENERIC_CONTEXT : 0), range);
    }
    exports.createAddHostValueKeyValuePairsMember = createAddHostValueKeyValuePairsMember;
    function createAddHostValueKeyValuePairsFunctionBody(classDeclaration) {
        var body = new Array();
        var range = classDeclaration.name.range;
        // for each field declaration, generate a check
        for (var _i = 0, _a = classDeclaration.members; _i < _a.length; _i++) {
            var member = _a[_i];
            // if it's an instance member, and it isn't marked private or protected
            if (member.is(assemblyscript_1.CommonFlags.INSTANCE) &&
                !member.is(assemblyscript_1.CommonFlags.PRIVATE | assemblyscript_1.CommonFlags.PROTECTED)) {
                switch (member.kind) {
                    // field declarations automatically get added
                    case assemblyscript_1.NodeKind.FIELDDECLARATION: {
                        var fieldDeclaration = member;
                        body.push(createPushHostObjectKeyStatement(member.name.text, fieldDeclaration.range));
                        body.push(createPushHostObjectValueStatement(member.name.text, fieldDeclaration.range));
                        break;
                    }
                    // function declarations can be getters, check the get flag
                    case assemblyscript_1.NodeKind.FUNCTIONDECLARATION: {
                        if (member.is(assemblyscript_1.CommonFlags.GET)) {
                            var functionDeclaration = member;
                            body.push(createPushHostObjectKeyStatement(functionDeclaration.name.text, functionDeclaration.range));
                            body.push(createPushHostObjectValueStatement(functionDeclaration.name.text, functionDeclaration.range));
                        }
                        break;
                    }
                }
            }
        }
        return assemblyscript_1.TypeNode.createBlockStatement(body, range);
    }
    // __aspectPushHostObjectKey
    function createPushHostObjectKeyStatement(name, range) {
        // __aspectPushHostObjectKey(hostObject, Reflect.toHostValue("propertyName", seen));
        return assemblyscript_1.TypeNode.createExpressionStatement(assemblyscript_1.TypeNode.createCallExpression(assemblyscript_1.TypeNode.createIdentifierExpression("__aspectPushHostObjectKey", range), null, [
            // hostObject
            assemblyscript_1.TypeNode.createIdentifierExpression("hostObject", range),
            // Reflect.toHostValue("propertyName", seen)
            assemblyscript_1.TypeNode.createCallExpression(
            // Reflect.toHostValue
            assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_1.TypeNode.createIdentifierExpression("toHostValue", range), range), null, [
                assemblyscript_1.TypeNode.createStringLiteralExpression(name, range),
                assemblyscript_1.TypeNode.createIdentifierExpression("seen", range),
            ], range),
        ], range));
    }
    function createPushHostObjectValueStatement(name, range) {
        // __aspectPushHostObjectValue(hostObject, Reflect.toHostValue(this.propertyName, seen));
        return assemblyscript_1.TypeNode.createExpressionStatement(
        // __aspectPushHostObjectValue(hostObject, Reflect.toHostValue(this.propertyName, seen))
        assemblyscript_1.TypeNode.createCallExpression(
        // __aspectPushHostObjectValue
        assemblyscript_1.TypeNode.createIdentifierExpression("__aspectPushHostObjectValue", range), null, [
            // hostObject
            assemblyscript_1.TypeNode.createIdentifierExpression("hostObject", range),
            // Reflect.toHostValue(this.propertyName, seen))
            assemblyscript_1.TypeNode.createCallExpression(
            // Reflect.toHostValue
            assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_1.TypeNode.createIdentifierExpression("toHostValue", range), range), null, [
                //this.propertyName
                assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createThisExpression(range), assemblyscript_1.TypeNode.createIdentifierExpression(name, range), range),
                // seen
                assemblyscript_1.TypeNode.createIdentifierExpression("seen", range),
            ], range),
        ], range));
    }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY3JlYXRlQWRkSG9zdFZhbHVlS2V5VmFsdWVQYWlyc01lbWJlci5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy90cmFuc2Zvcm0vY3JlYXRlQWRkSG9zdFZhbHVlS2V5VmFsdWVQYWlyc01lbWJlci50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7OztJQUFBLG1EQVcwQjtJQUMxQiwyRUFBMEU7SUFFMUUsU0FBZ0IscUNBQXFDLENBQ25ELGdCQUFrQztRQUVsQyxJQUFNLEtBQUssR0FBRyxnQkFBZ0IsQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDO1FBQzFDLGtGQUFrRjtRQUNsRixPQUFPLHlCQUFRLENBQUMsdUJBQXVCLENBQ3JDLHlCQUFRLENBQUMsMEJBQTBCLENBQ2pDLG1DQUFtQyxFQUNuQyxLQUFLLENBQ04sRUFDRCxJQUFJLEVBQ0oseUJBQVEsQ0FBQyxrQkFBa0IsQ0FDekI7WUFDRSxrQkFBa0I7WUFDbEIseUJBQVEsQ0FBQyxlQUFlLENBQ3RCLHlCQUFRLENBQUMsMEJBQTBCLENBQUMsWUFBWSxFQUFFLEtBQUssQ0FBQyxFQUN4RCx1REFBMEIsQ0FBQyxLQUFLLEVBQUUsS0FBSyxDQUFDLEVBQ3hDLElBQUksRUFDSiw4QkFBYSxDQUFDLE9BQU8sRUFDckIsS0FBSyxDQUNOO1lBRUQsd0JBQXdCO1lBQ3hCLHlCQUFRLENBQUMsZUFBZSxDQUN0Qix5QkFBUSxDQUFDLDBCQUEwQixDQUFDLE1BQU0sRUFBRSxLQUFLLENBQUMsRUFDbEQseUJBQVEsQ0FBQyxlQUFlLENBQ3RCLHlCQUFRLENBQUMsb0JBQW9CLENBQUMsS0FBSyxFQUFFLEtBQUssQ0FBQyxFQUMzQztnQkFDRSx1REFBMEIsQ0FBQyxPQUFPLEVBQUUsS0FBSyxDQUFDO2dCQUMxQyx1REFBMEIsQ0FBQyxLQUFLLEVBQUUsS0FBSyxDQUFDO2FBQ3pDLEVBQ0QsS0FBSyxFQUNMLEtBQUssQ0FDTixFQUNELElBQUksRUFDSiw4QkFBYSxDQUFDLE9BQU8s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