package
{
	import jiglib.geometry.JTerrain;

	import away3d.cameras.HoverCamera3D;
	import away3d.containers.View3D;
	import away3d.lights.PointLight3D;
	import away3d.materials.ShadingColorMaterial;

	import jiglib.physics.RigidBody;
	import jiglib.plugin.away3d.Away3DPhysics;

	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class Main extends MovieClip
	{
		private var view:View3D;
		private var physics:Away3DPhysics;
		private var mylight:PointLight3D;
		private var terrain:JTerrain;
		
		[Embed(source="../res/hightmap1.jpg")]
		public var TERRIAN_MAP:Class;

		public function Main()
		{
			init3D();
			configureListeners();
		}

		private function init3D():void
		{
			view = new View3D();
			view.x = stage.stageWidth / 2;
			view.y = stage.stageHeight / 2;
			addChild(view);

			view.camera = new HoverCamera3D();

			mylight = new PointLight3D();
			view.scene.addLight(mylight);
			mylight.ambient = 0.4;
			mylight.y = 600;
			mylight.z = -700;

			physics = new Away3DPhysics(view, 8);
			var shadingColorMaterialGreen:ShadingColorMaterial = new ShadingColorMaterial(0x77ee77);
			var shadingColorMaterialPink:ShadingColorMaterial = new ShadingColorMaterial(0xFF00FF);

			// var ground:RigidBody = physics.createGround({material:shadingColorMaterialGreen, width:800, height:800, segmentsW:10, segmentsH:10});

			var terrainBMD:Bitmap = new TERRIAN_MAP as Bitmap;
			terrain = physics.createTerrain(terrainBMD.bitmapData, {material:shadingColorMaterialGreen, width:800, height:800, segmentsW:20, segmentsH:20, maxHeight:350});

			var cube:RigidBody = physics.createCube({material:shadingColorMaterialPink, width:50, height:50, depth:50});

			cube.x = -250;
			cube.y = 350;

			view.camera.y = 700;
			view.camera.z = -400;
			view.camera.lookAt(physics.getMesh(cube).position);
			view.camera.zoom = 4;
		}

		private function configureListeners():void
		{
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown, false, 0, true);
		}

		private function onKeyDown(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.UP:
					break;
				case Keyboard.DOWN:
					break;
				case Keyboard.LEFT:
					break;
				case Keyboard.RIGHT:
					break;
			}
		}

		private function onEnterFrame(event:Event):void
		{
			view.render();
			physics.engine.integrate(0.2);
		}
	}
}
