package ra;

import org.bytedeco.llvm.LLVM.LLVMValueRef;

public interface RegisterAllocator {
    public int allocate(LLVMValueRef func);
    public Location resolveOprand(LLVMValueRef oprand);
}
