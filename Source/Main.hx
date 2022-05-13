package;

import com.senocular.display.TransformTool;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.display.DisplayObjectContainer;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.Font;
import openfl.text.TextFormat;
import openfl.Lib;
import openfl.display.Stage;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.events.KeyboardEvent;

class Main extends Sprite 
{
	
	public static function main() {
		Lib.current.stage.frameRate = 60;
		var s:Sprite = new Sprite();
		Lib.current.addChild( s );
		
		var b:Bitmap = new Bitmap( Assets.getBitmapData("assets/haxe_logo.png") );
		s.addChild( b );
		s.x = (300 - s.width) / 2;
		s.y = (200 - s.height) / 2;
		
		var tool:TransformTool = new TransformTool();
		Lib.current.addChild( tool );
		tool.target = s;
		tool.registration = new Point( s.x + s.width / 2, s.y + s.height / 2 );
    }
	
} 