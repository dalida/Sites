<?php class ImageQueueCommand extends CConsoleCommand
{
  public $verbose=false;
  public $checkpoint=false;

  public function actionRunEmailQueueByView($view="undefined", $limit=100, $test_email="test@shavacity.com") {
    $queuemanager = new EMailQueueManager;
    $queuemanager->init();
    $emails = ImageQueue::model()->findAllByAttributes(array('view'=>$view,'enabled'=>1,'status'=>'ready'));
    // pass the command for rendering methods
    foreach ($emails as $em) {
      // process $em
    }
  }

  public function actionShowEmailQueue($view="undefined", $limit=100) {
    $queuemanager = new EMailQueueManager;
    foreach ($emails as $em) {
      // show $em
      CVarDumper::dump($em->attributes);
    }
  }

}
?>
