package com.senocular.display;

import openfl.display.DisplayObject;
import openfl.display.InteractiveObject;
import openfl.display.Shape;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.geom.Matrix;
import openfl.geom.Point;

import com.senocular.display.TransformTool;
import com.senocular.display.TransformToolControl;
import com.senocular.display.TransformToolCursor;

// Controls
class TransformToolInternalControl extends TransformToolControl {
	
	public var interactionMethod:Dynamic;
	public var referenceName:String;
	public var _skin:DisplayObject;
	
	public var skin( get, set ):DisplayObject;
	
	public function set_skin(skin:DisplayObject):DisplayObject {
		if (_skin != null && contains(_skin)) {
			removeChild(_skin);
		}
		_skin = skin;
		if (_skin != null) {
			addChild(_skin);
		}
		draw();
		return skin;
	}
	
	public function get_skin():DisplayObject {
		return _skin;
	}
	
	override public function get_referencePoint():Point {
		return _transformTool.getPointByReferenceName( referenceName );
	}
		
	/*
	 * Constructor
	 */	
	public function new(name:String, interactionMethod:Dynamic = null, referenceName:String = null) {
		super();
		this.name = name;
		this.interactionMethod = interactionMethod;
		this.referenceName = referenceName;
		addEventListener(TransformTool.CONTROL_INIT, init);
	}
	
	private function init(event:Event):Void {
		_transformTool.addEventListener(TransformTool.NEW_TARGET, draw);
		_transformTool.addEventListener(TransformTool.TRANSFORM_TOOL, draw);
		_transformTool.addEventListener(TransformTool.CONTROL_TRANSFORM_TOOL, position);
		_transformTool.addEventListener(TransformTool.CONTROL_PREFERENCE, draw);
		_transformTool.addEventListener(TransformTool.CONTROL_MOVE, controlMove);
		draw();
	}
	
	public function draw(event:Event = null):Void {
		if (_transformTool.maintainControlForm) {
			counterTransform();
		}
		position();
	}
	
	public function position(event:Event = null):Void {
		var reference:Point = referencePoint;
		if (reference != null) {
			x = reference.x;
			y = reference.y;
		}
	}
	
	private function controlMove(event:Event):Void {
		if (interactionMethod != null && _transformTool.currentControl == this) {
			interactionMethod();
		}
	}
}
