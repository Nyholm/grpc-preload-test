<?php

require_once dirname(__DIR__).'/vendor/autoload.php';

$app = new \Grpc\Test\Application();
$app->run();
