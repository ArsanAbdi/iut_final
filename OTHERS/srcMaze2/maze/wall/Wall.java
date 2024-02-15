package maze.wall;

import maze.MazeComponent;

public abstract class Wall implements MazeComponent{

	public void enter() {
		System.out.println("Ouch!");
	}
	
	public String toString() {
		return "wall";
	}

}
