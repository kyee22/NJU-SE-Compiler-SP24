package type;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Scope<T> {
    private Map<String, T> map;
    private Scope<T> parent;

    public Scope(Scope parent) {
        this.parent = parent;
        this.map = new HashMap<>();
    }

    public Scope() {
        this(null);
    }

    public Scope getParent() {
        return parent;
    }

    public void define(String name, T type) {
        map.put(name, type);
    }

    public void defineAll(List<String> names, List<T> types) {
        assert names.size() == types.size();
        for (int i = 0; i < names.size(); ++i) {
            define(names.get(i), types.get(i));
        }
    }

    /**
     *  Note 1:
     *      when define:
     *          legal: define a variable c, and define a variable c in another scope
     *
     *      ===> when check REDEF for variable, call `localResolve`
     *      ===> when check REDEF for function, call `localResolve` or `resolve`
     **
     */
    public T resolve(String name) {
        if (map.containsKey(name)) {
            return map.get(name);
        } else if (this.parent != null) {
            return this.parent.resolve(name);
        }

        return null;
    }

    public T localResolve(String name) {
        if (map.containsKey(name)) {
            return map.get(name);
        }

        return null;
    }

    public T resolveFuncType(String name) {
        if (map.containsKey(name) && map.get(name) instanceof FuncType) {
            return map.get(name);
        } else if (this.parent != null) {
            return this.parent.resolve(name);
        }
        return null;
    }

    public boolean isGlobalScope() {
        return parent == null;
    }
}
