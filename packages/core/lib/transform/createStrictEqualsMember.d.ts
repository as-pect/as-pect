import { ClassDeclaration, FunctionDeclaration } from "./assemblyscript";
/**
 * This method creates a single FunctionDeclaration that allows Reflect.equals
 * to validate normal class member values.
 *
 * @param {ClassDeclaration} classDeclaration - The class that requires a new function.
 */
export declare function createStrictEqualsMember(classDeclaration: ClassDeclaration): FunctionDeclaration;
//# sourceMappingURL=createStrictEqualsMember.d.ts.map