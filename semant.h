#ifndef SEMANT_H_
#define SEMANT_H_

#include <assert.h>
#include <iostream>
#include "cool-tree.h"
#include "stringtab.h"
#include "symtab.h"
#include "list.h"

#define TRUE 1
#define FALSE 0

class ClassTable;
typedef ClassTable *ClassTableP;

class ClassTable {
private:
  int semant_errors;
  void install_basic_classes();
  ostream& error_stream;
  Classes classes_;
  Class_ current_class_;

public:
  ClassTable(Classes);
  int errors() { return semant_errors; }
  ostream& semant_error();
  ostream& semant_error(Class_ c);
  ostream& semant_error(Symbol filename, tree_node *t);

  Class_ get_class(Symbol name);
  bool check_class(Class_ c);

  void set_current_class(Class_ c) { current_class_ = c; }
  Class_ get_current_class() { return current_class_; }

  Symbol get_return_type(Symbol c, Symbol m);
  method_class* get_method(Class_ c, Symbol m);

  void publish_variables(Class_ c);
  void publish_variables(method_class* m);

  bool is_subclass(Class_ c1, Class_ c2);
  Symbol get_lub(Class_ c1, Class_ c2);

  SymbolTable<Symbol, Entry> symbols_;
};


#endif
