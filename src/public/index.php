<?php

namespace Application;

use Application\Controller\Index;

try {
    require_once dirname(__DIR__) . '/vendor/autoload.php';
    $index = Index::render();
    echo $index;

} catch (\Throwable $e) {
    echo $e;
}