<?php
/**
 * Bones, a PHP Project Skeleton
 *
 * @version 000.1.0 Initial Release
 * @license The MIT License, http://opensource.org/licenses/MIT
 *
 * @filesource
 */
declare(strict_types=1);

namespace Application\Controller;

use Application\Library\Bootstrap;

class Index
{
    public static function render(): string
    {
        return Bootstrap::APPLICATION_NAME;
    }
}