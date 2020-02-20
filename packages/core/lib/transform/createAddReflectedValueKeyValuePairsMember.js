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
    function createAddReflectedValueKeyValuePairsMember(classDeclaration) {
        var range = classDeclaration.name.range;
        // __aspectAddReflectedValueKeyValuePairs(reflectedValue: i32, seen: Map<usize, i32>): void
        return assemblyscript_1.TypeNode.createMethodDeclaration(assemblyscript_1.TypeNode.createIdentifierExpression("__aspectAddReflectedValueKeyValuePairs", range), null, assemblyscript_1.TypeNode.createFunctionType([
            // reflectedValue: i32
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("reflectedValue", range), createGenericTypeParameter_1.createGenericTypeParameter("i32", range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
            // seen: Map<usize, i32>
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("seen", range), assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("Map", range), [
                createGenericTypeParameter_1.createGenericTypeParameter("usize", range),
                createGenericTypeParameter_1.createGenericTypeParameter("i32", range),
            ], false, range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
        ], assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("void", range), [], false, range), null, false, range), createAddReflectedValueKeyValuePairsFunctionBody(classDeclaration), null, assemblyscript_1.CommonFlags.PUBLIC |
            assemblyscript_1.CommonFlags.INSTANCE |
            (classDeclaration.isGeneric ? assemblyscript_1.CommonFlags.GENERIC_CONTEXT : 0), range);
    }
    exports.createAddReflectedValueKeyValuePairsMember = createAddReflectedValueKeyValuePairsMember;
    function createAddReflectedValueKeyValuePairsFunctionBody(classDeclaration) {
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
                        body.push(createPushReflectedObjectKeyStatement(member.name.text, fieldDeclaration.range));
                        body.push(createPushReflectedObjectValueStatement(member.name.text, fieldDeclaration.range));
                        break;
                    }
                    // function declarations can be getters, check the get flag
                    case assemblyscript_1.NodeKind.FUNCTIONDECLARATION: {
                        if (member.is(assemblyscript_1.CommonFlags.GET)) {
                            var functionDeclaration = member;
                            body.push(createPushReflectedObjectKeyStatement(functionDeclaration.name.text, functionDeclaration.range));
                            body.push(createPushReflectedObjectValueStatement(functionDeclaration.name.text, functionDeclaration.range));
                        }
                        break;
                    }
                }
            }
        }
        return assemblyscript_1.TypeNode.createBlockStatement(body, range);
    }
    // __aspectPushReflectedObjectKey
    function createPushReflectedObjectKeyStatement(name, range) {
        // __aspectPushReflectedObjectKey(reflectedValue, Reflect.toReflectedValue("propertyName", seen));
        return assemblyscript_1.TypeNode.createExpressionStatement(assemblyscript_1.TypeNode.createCallExpression(assemblyscript_1.TypeNode.createIdentifierExpression("__aspectPushReflectedObjectKey", range), null, [
            // reflectedValue
            assemblyscript_1.TypeNode.createIdentifierExpression("reflectedValue", range),
            // Reflect.toReflectedValue("propertyName", seen)
            assemblyscript_1.TypeNode.createCallExpression(
            // Reflect.toReflectedValue
            assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_1.TypeNode.createIdentifierExpression("toReflectedValue", range), range), null, [
                assemblyscript_1.TypeNode.createStringLiteralExpression(name, range),
                assemblyscript_1.TypeNode.createIdentifierExpression("seen", range),
            ], range),
        ], range));
    }
    function createPushReflectedObjectValueStatement(name, range) {
        // __aspectPushReflectedObjectValue(reflectedValue, Reflect.toReflectedValue(this.propertyName, seen));
        return assemblyscript_1.TypeNode.createExpressionStatement(
        // __aspectPushReflectedObjectValue(reflectedValue, Reflect.toReflectedValue(this.propertyName, seen))
        assemblyscript_1.TypeNode.createCallExpression(
        // __aspectPushReflectedObjectValue
        assemblyscript_1.TypeNode.createIdentifierExpression("__aspectPushReflectedObjectValue", range), null, [
            // reflectedValue
            assemblyscript_1.TypeNode.createIdentifierExpression("reflectedValue", range),
            // Reflect.toReflectedValue(this.propertyName, seen))
            assemblyscript_1.TypeNode.createCallExpression(
            // Reflect.toReflectedValue
            assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_1.TypeNode.createIdentifierExpression("toReflectedValue", range), range), null, [
                //this.propertyName
                assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createThisExpression(range), assemblyscript_1.TypeNode.createIdentifierExpression(name, range), range),
                // seen
                assemblyscript_1.TypeNode.createIdentifierExpression("seen", range),
            ], range),
        ], range));
    }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY3JlYXRlQWRkUmVmbGVjdGVkVmFsdWVLZXlWYWx1ZVBhaXJzTWVtYmVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3RyYW5zZm9ybS9jcmVhdGVBZGRSZWZsZWN0ZWRWYWx1ZUtleVZhbHVlUGFpcnNNZW1iZXIudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFBQSxtREFXMEI7SUFDMUIsMkVBQTBFO0lBRTFFLFNBQWdCLDBDQUEwQyxDQUN4RCxnQkFBa0M7UUFFbEMsSUFBTSxLQUFLLEdBQUcsZ0JBQWdCLENBQUMsSUFBSSxDQUFDLEtBQUssQ0FBQztRQUMxQywyRkFBMkY7UUFDM0YsT0FBTyx5QkFBUSxDQUFDLHVCQUF1QixDQUNyQyx5QkFBUSxDQUFDLDBCQUEwQixDQUNqQyx3Q0FBd0MsRUFDeEMsS0FBSyxDQUNOLEVBQ0QsSUFBSSxFQUNKLHlCQUFRLENBQUMsa0JBQWtCLENBQ3pCO1lBQ0Usc0JBQXNCO1lBQ3RCLHlCQUFRLENBQUMsZUFBZSxDQUN0Qix5QkFBUSxDQUFDLDBCQUEwQixDQUFDLGdCQUFnQixFQUFFLEtBQUssQ0FBQyxFQUM1RCx1REFBMEIsQ0FBQyxLQUFLLEVBQUUsS0FBSyxDQUFDLEVBQ3hDLElBQUksRUFDSiw4QkFBYSxDQUFDLE9BQU8sRUFDckIsS0FBSyxDQUNOO1lBRUQsd0JBQXdCO1lBQ3hCLHlCQUFRLENBQUMsZUFBZSxDQUN0Qix5QkFBUSxDQUFDLDBCQUEwQixDQUFDLE1BQU0sRUFBRSxLQUFLLENBQUMsRUFDbEQseUJBQVEsQ0FBQyxlQUFlLENBQ3RCLHlCQUFRLENBQUMsb0JBQW9CLENBQUMsS0FBSyxFQUFFLEtBQUssQ0FBQyxFQUMzQztnQkFDRSx1REFBMEIsQ0FBQyxPQUFPLEVBQUUsS0FBSyxDQUFDO2dCQUMxQyx1REFBMEIsQ0FBQyxLQUFLLEVBQUUsS0FBSyxDQUFDO2FBQ3pDLEVBQ0QsS0FBSyxFQUNMLEtBQUssQ0FDTixFQUNELElBQUksRUFDSiw4QkFB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