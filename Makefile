include Makefile.git

LLVM_JAR = $(shell echo `find /usr/local/lib -name "llvm-*.jar"` | sed  "s/\s\+/:/g")
JAVACPP_JAR = $(shell echo `find /usr/local/lib -name "javacpp-*.jar"` | sed  "s/\s\+/:/g")
ANTLR_PATH = $(shell find /usr/local/lib -name "antlr-*-complete.jar")
RARS_PATH = $(shell find /usr/local/lib -name "rars.jar")

export CLASSPATH=$(ANTLR_PATH):$(LLVM_JAR):$(JAVACPP_JAR)

DOMAINNAME = oj.compilers.cpl.icu
ANTLR = java -jar $(ANTLR_PATH) -listener -visitor -long-messages
JAVAC = javac -g
JAVA = java
RARS = java -jar $(RARS_PATH)
CC = gcc


PFILE = $(shell find . -name "SysYParser.g4")
LFILE = $(shell find . -name "SysYLexer.g4")
JAVAFILE = $(shell find . -name "*.java")

# Define FILEPATH and IRPATH
FILEPATH = $(shell echo $(FILEPATH))
IRPATH = $(patsubst tests/%,ir/%,$(FILEPATH:.sy=.ll))
ASMPATH = $(patsubst tests/%,asm/%,$(FILEPATH:.sy=.asm))

compile: antlr
	$(call git_commit,"make")
	mkdir -p classes
	$(JAVAC) -classpath $(CLASSPATH) $(JAVAFILE) -d classes

run: compile
	@if [ -n "$(FILEPATH)" ]; then \
		if [ -n "$(IRPATH)" ]; then \
			$(JAVA) -classpath ./classes:$(CLASSPATH) Main $(FILEPATH) $(ASMPATH); \
		else \
			$(JAVA) -classpath ./classes:$(CLASSPATH) Main $(FILEPATH); \
		fi \
	else \
		@echo "FILEPATH is not set. Skipping run."; \
	fi
# 	@echo "====================== student output ======================";
# 	@lli $(IRPATH); echo $$?
# 	@echo "====================== correct output ======================"
# 	@$(CC) -x c -o judge $(FILEPATH)
# 	@./judge; echo $$?
# 	@rm judge
	@echo "====================== 🚀 student output 🚀 ======================";
	@lli $(IRPATH); STUDENT_RET=$$?; \
	echo $$STUDENT_RET
	@echo "====================== 💡 correct output 💡 ======================";
	@$(CC) -x c -o judge $(FILEPATH)
	@./judge; CORRECT_RET=$$?; \
	echo $$CORRECT_RET
	@rm judge
	@echo "========================== 🧩 result 🧩 =========================="
	@if [ $$STUDENT_RET -eq $$CORRECT_RET ]; then \
		echo "\033[32m✅  ACCEPTED\n\033[0m"; \
	else \
		echo "\033[31m❌  WRONG ANSWER\n\033[0m"; \
	fi



antlr: $(LFILE) $(PFILE)
	$(ANTLR) $(PFILE) $(LFILE)

test: compile
	$(call git_commit, "test")
	if [ -e nohup.out ]; then rm nohup.out; fi
	nohup java -classpath ./classes:$(CLASSPATH) Main ./tests/test1.sysy ./tests/test1.ll &

codegen: compile
	@if [ -n "$(FILEPATH)" ]; then \
		if [ -n "$(ASMPATH)" ]; then \
			$(JAVA) -classpath ./classes:$(CLASSPATH) Main $(FILEPATH) $(ASMPATH); \
		else \
			$(JAVA) -classpath ./classes:$(CLASSPATH) Main $(FILEPATH); \
		fi \
	else \
		@echo "FILEPATH is not set. Skipping run."; \
	fi
# 	@echo "====================== student output ======================";
# 	@$(RARS) $(ASMPATH) ic; echo "exit code:" $$?
# 	@echo "====================== correct output ======================"
# 	@$(CC) -x c -o judge $(FILEPATH)
# 	@./judge; echo $$?
# 	@rm judge
	@echo "====================== 🚀 student output 🚀 ======================";
	@$(RARS) $(ASMPATH) ic; STUDENT_RET=$$?; \
	echo "Exit code:" $$STUDENT_RET
	@echo "====================== 💡 correct output 💡 ======================";
	@$(CC) -x c -o judge $(FILEPATH)
	@./judge; CORRECT_RET=$$?; \
	echo $$CORRECT_RET
	@rm judge
	@echo "========================== 🧩 result 🧩 =========================="
	@if [ $$CORRECT_RET -eq $$STUDENT_RET  ]; then \
		echo "\033[32m✅  ACCEPTED  \n\033[0m"; \
	else \
		echo "\033[31m❌  WRONG ANSWER\n\033[0m"; \
	fi





clean:
	rm -f src/*.tokens
	rm -f src/*.interp
# 	rm -f src/SysYLexer.java src/SysYParser.java src/SysYParserBaseListener.java src/SysYParserBaseVisitor.java src/SysYParserListener.java src/SysYParserVisitor.java
	rm -rf classes
# 	rm -rf out
	rm -rf src/.antlr


submit: clean
	git gc
	bash submit.sh


.PHONY: compile antlr test run clean submit


