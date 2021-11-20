package;
import flixel.addons.display.FlxBackdrop;
import flixel.*;
import flixel.util.*;
import flixel.addons.effects.chainable.*;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.*;
import FlxEffectSprite;
/**
 * dont look.
 * this code is a fucking mess
 */
class HankMenu extends MusicBeatState {
    var hank:FlxSprite;
    var curDifficulty = 1;
    var alphabets:FlxTypedGroup<Alphabet>;
    var diff:FlxSprite;
    var titleText:FlxSprite;
    var bg0:FlxSprite;
	var bg1:FlxSprite;
	var bg2:FlxSprite;
	var bg3:FlxSprite;

    var hank0:FlxSprite;
    var hank1:FlxSprite;
    var hank2:FlxSprite;
    var hank3:FlxSprite;

    var hank4:FlxSprite;
    var hank5:FlxSprite;
    var hank6:FlxSprite;
    var hank7:FlxSprite;
    override function create() {
        var bgasset = Paths.image('menuDesat');

		bg0 = new FlxSprite(0, 0).loadGraphic(bgasset);
        bg0.color = 0xFFCD3C2E;
		bg1 = new FlxSprite(0, 0).loadGraphic(bgasset);
        bg1.color = 0xFFCD3C2E;
		bg2 = new FlxSprite(0, 0).loadGraphic(bgasset);
        bg2.color = 0xFFCD3C2E;
		bg3 = new FlxSprite(0, 0).loadGraphic(bgasset);
        bg3.color = 0xFFCD3C2E;

		add(bg0);
		add(bg1);
		add(bg2);
		add(bg3);

        var blackBar1:FlxSprite = new FlxSprite(0, 0).makeGraphic(FlxG.width, 75, FlxColor.BLACK);
        blackBar1.alpha = 0.25;
        add(blackBar1);

        var blackBar2:FlxSprite = new FlxSprite(0, FlxG.height - 75).makeGraphic(FlxG.width, 75, FlxColor.BLACK);
        blackBar2.alpha = 0.25;
        add(blackBar2);
        var hanktextasset = Paths.image('accelerant/menu/hank', 'shared');

        hank0 = new FlxSprite(0,-30).loadGraphic(hanktextasset);
        hank0.alpha = 0.5;
        hank1 = new FlxSprite(0,-30).loadGraphic(hanktextasset);
        hank1.alpha = 0.5;
        hank2 = new FlxSprite(0,-30).loadGraphic(hanktextasset);
        hank2.alpha = 0.5;
        hank3 = new FlxSprite(0,-30).loadGraphic(hanktextasset);
        hank3.alpha = 0.5;

        add(hank0);
        add(hank1);
        add(hank2);
        add(hank3);

        hank4 = new FlxSprite(0,FlxG.height - 90).loadGraphic(hanktextasset);
        hank4.alpha = 0.5;
        hank5 = new FlxSprite(0,FlxG.height - 90).loadGraphic(hanktextasset);
        hank5.alpha = 0.5;
        hank6 = new FlxSprite(0,FlxG.height - 90).loadGraphic(hanktextasset);
        hank6.alpha = 0.5;
        hank7 = new FlxSprite(0,FlxG.height - 90).loadGraphic(hanktextasset);
        hank7.alpha = 0.5;

        add(hank4);
        add(hank5);
        add(hank6);
        add(hank7);

        var triangle:FlxSprite = new FlxSprite(0,0).loadGraphic(Paths.image('accelerant/menu/thatWeirdThingOnTheSide', 'shared'));
        add(triangle);

        hank = new FlxSprite(25, 100);
        hank.frames = Paths.getSparrowAtlas('accelerant/menu/hankIdle', 'shared');
        hank.animation.addByPrefix('idle', 'Hank Idle');
        hank.scale.set(0.85, 0.85);
        hank.updateHitbox(); //lolsss
        hank.animation.play('idle');
        add(hank);

        var accel:FlxSprite = new FlxSprite(633, 179).loadGraphic(Paths.image('accelerant/menu/accelerant', 'shared'));
        add(accel);

        diff = new FlxSprite(790, 392).loadGraphic(Paths.image('accelerant/menu/hard', 'shared'));
        add(diff);

        titleText = new FlxSprite(657, 494);
		titleText.frames = Paths.getSparrowAtlas('titleEnter');
		titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
		titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
		titleText.antialiasing = true;
		titleText.animation.play('idle', true);
        titleText.scale.set(0.5, 0.5);
		titleText.updateHitbox();
		// titleText.screenCenter(X);
		add(titleText);

        move();
        movetext();
        movetext2();
        #if mobileC
        addVirtualPad(LEFT_RIGHT, A_B);
        #end
        super.create();
    }
    function move(?tween) {
		bg0.x = 0;

		bg1.x = -1280;

		bg2.x = 0;

		bg3.x = -1280;

		var duration:Float = 25;

		// bg 1
		FlxTween.num(0, 1280, duration, {onComplete: move}, num -> {
			bg0.x = num;
		});

		// bg 2
		FlxTween.num(-1280, 0, duration, {}, num -> {
			bg1.x = num;
		});


		// bg 3
		FlxTween.num(0, 1280, duration, {}, num -> {
			bg2.x = num;
		});

		// bg 4  
		FlxTween.num(-1280, 0, duration, {}, num -> {
			bg3.x = num;
		});
	}
    function movetext(?tween) {
		hank0.x = 0;

		hank1.x = -1280;

		hank2.x = 0;

		hank3.x = -1280;

		var duration:Float = 7.5;

		// hank 1
		FlxTween.num(0, 1280, duration, {onComplete: movetext}, num -> {
			hank0.x = num;
		});

		// hank 2
		FlxTween.num(-1280, 0, duration, {}, num -> {
			hank1.x = num;
		});


		// hank 3
		FlxTween.num(0, 1280, duration, {}, num -> {
			hank2.x = num;
		});

		// hank 4  
		FlxTween.num(-1280, 0, duration, {}, num -> {
			hank3.x = num;
		});
	}
    function movetext2(?tween) {
		hank4.x = 0;

		hank5.x = 1280;

		hank6.x = 0;

		hank7.x = 1280;

		var duration:Float = 7.5;

		// hank 1
		FlxTween.num(0, -1280, duration, {onComplete: movetext2}, num -> {
			hank4.x = num;
		});

		// hank 2
		FlxTween.num(1280, 0, duration, {}, num -> {
			hank5.x = num;
		});


		// hank 3
		FlxTween.num(1280, 0, duration, {}, num -> {
			hank6.x = num;
		});

		// hank 4  
		FlxTween.num(0, -1280, duration, {}, num -> {
			hank7.x = num;
		});
	}
    override function update(elapsed) {
        super.update(elapsed);
        if (FlxG.mouse.justPressed) {
            FlxG.mouse.visible = true;
            trace('\nX: ' + FlxG.mouse.x + ' \nY: ' + FlxG.mouse.y);
        }
        if (controls.ACCEPT)
        {
            FlxG.sound.play(Paths.sound('confirmMenu'));
            titleText.animation.play('press');
            new FlxTimer().start(1, function(_){
            var poop:String = Highscore.formatSong('accelerant', curDifficulty);

            PlayState.SONG = Song.loadFromJson(poop, 'accelerant');
			PlayState.isStoryMode = false;
			PlayState.storyDifficulty = curDifficulty;
			PlayState.storyWeek = 7;
			trace('CUR WEEK' + PlayState.storyWeek);
			LoadingState.loadAndSwitchState(new PlayState());
            });
        }
        if (controls.BACK)
            FlxG.switchState(new MainMenuState());
        if (controls.RIGHT_P)
            changeDiff(1);
        if (controls.LEFT_P)
            changeDiff(-1);
        
    }
    override function beatHit() {
        hank.animation.play('idle');
    }
    function changeDiff(diffChange:Int)
    {
        curDifficulty += diffChange;
        if (curDifficulty > 2)
            curDifficulty = 0;
        else if (curDifficulty < 0)
            curDifficulty = 2;
        var diffstring:Array<String> = ['baby', 'hard', 'fucked'];
        diff.alpha = 0;
        diff.loadGraphic(Paths.image('accelerant/menu/' + diffstring[curDifficulty], 'shared'));
    
        FlxG.sound.play(Paths.sound('scrollMenu'));
        FlxTween.tween(diff, {alpha: 1}, 0.07);
    }
}