(*
 *  CS164 Fall 94
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 *)

class StackElement {
  elementBelow : StackElement;
  value : String;

  init(val : String) : Object {
    value <- val
  };

  getValue() : String {
    value
  };

  setElementBelow(below : StackElement) {
    elementBelow <- below
  };

  getElementBelow() : StackElement {
    "elementBelow"
  };

	duplicateName(val : String, val : String) : StackElement {
		elementBelow
	};

	keywordAsParameter(String : String) : StackElement {
		elementBelow
	};
};

class Stack inherits IO {
  head : StackElement;
  temp : StackElement;
  size : Int;

  init() : Object {{
    size <- 0;
  }};

  push(element : StackElement) : Object {{
    element.setElementBelow(head);
    head <- element;
    size <- size + 1;
  }};

  pushValue(value : String) : Object {{
    temp <- new StackElement;
    temp.init(value);
    push(temp);
  }};

  pop() : StackElement {{
    if not isvoid head then {
      temp <- head;
      head <- head.getElementBelow();
      size <- size - 1;
      temp;
    } else {
      head;
    }
    fi;
  }};

  getSize() : Int {
    size
  };

  printStack() : Object {{
    temp <- head;

    while temp loop {
      out_string(temp.getValue());
      out_string("\n");
      temp <- temp.getElementBelow();
    }
    pool;
  }};
};

class Main inherits IO {
   keepGoing : Bool;
   stringRead : String;
   stack : Stack;
   command : StackElement;
   head1 : StackElement;
   head2 : StackElement;
   intAux : Int;
   a2i : A2I;

   main() : Object {{
      out_string("TP 1 Compiladores 2016/2 - Tadeu Rahian\n");
      out_string("Digite seus comandos:\n");

      keepGoing <- true;
      stringRead <- "";
      a2i <- new A2I;
      stack <- new Stack;

			intAux <- intAux + stringRead;
			intAux <- intAux * stringRead;
			intAux <- intAux / stringRead;
			intAux <- intAux < stringRead;
			intAux <- intAux > stringRead;

      stack.init();

      while keepGoing loop {
        out_string(">");
        stringRead <- in_string();
        intAux <- 0;

        if stringRead = "d" then
          stack.printStack()
        else if stringRead = "x" then
          keepGoing <- false
        else if stringRead = "e" then {
          if 2 < stack.getSize() then {
            command <- stack.pop();

            if command.getValue() = "+" then {
              head1 <- stack.pop();
              head2 <- stack.pop();

              intAux <- a2i.c2i(head1.getValue()) + a2i.c2i(head2.getValue());

              stack.pushValue(a2i.i2c(intAux));
            } else if command.getValue() = "s" then {
              head1 <- stack.pop();
              head2 <- stack.pop();

              stack.push(head1);
              stack.push(head2);
            } else {
              stack.push(command);
            }
            fi fi;
          } else {
            "nothing";
          }
          fi;
        } else {
          stack.pushValue(stringRead);
        }
        fi fi fi;
      }
      pool;
   }};
};
