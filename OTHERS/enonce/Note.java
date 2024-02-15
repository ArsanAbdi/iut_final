package enonce;
import java.util.Optional;

public class Note {

    private Module module;
    private Integer val;

    public Note(Module module, Integer val) {
	this.module = module;
	this.val = val;
    }

    public Module getModule() {
	return module;
    }

    public void setModule(Module module) {
	this.module = module;
    }

    public Integer getVal() {
	return val;
    }

    public void setVal(Integer val) {
	this.val = val;
    }

    @Override
    public String toString() {
	return "Note [module=" + module + ", val=" + val + "]";
    }

}
