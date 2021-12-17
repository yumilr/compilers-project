#include "heading.h"

enum ID_type {
    fun,
    var
};

enum F_type {
    sin_tipo,
    entero
};

enum V_type {
    simple,
    arreglo
};

struct attr{
    ID_type id;
    F_type f;
    V_type v;
    int asize;
    int val;
};

struct SymbolTable {
    vector<map<string, attr> > tables;

    SymbolTable() {
        tables.push_back(map<string, attr>());
    }

    map<string, attr>& current() {
        return tables[tables.size() - 1];
    }

    void insert_symbol(string id, attr val) {
        map<string, attr> &curr = current();
        curr.insert(pair<string, attr>(id, val));
    }

    bool search_symbol_local(string id) {
        map<string, attr> &curr = current();
        return curr.find(id) != curr.end();
    }

    bool search_symbol_global(string id) {
        for (int i = 0; i < tables.size(); i++) {
            if (tables[i].find(id) != tables[i].end())
                return true;
        }
        return false;
    }

    void update_symbol(string id, attr new_val) {
        map<string, attr> &curr = current();
        curr[id] = new_val;
    }

    void add_scope() {
        tables.push_back(map<string, attr>());
    }

    void remove_scope() {
        tables.pop_back();
    }
};