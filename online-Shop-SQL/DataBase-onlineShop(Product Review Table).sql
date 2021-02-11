CREATE TABLE `shop`.`product_review` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `productId` BIGINT NOT NULL,
  `parentId` BIGINT NULL DEFAULT NULL,
  `title` VARCHAR(100) NOT NULL,
  `rating` SMALLINT(6) NOT NULL DEFAULT 0,
  `published` TINYINT(1) NOT NULL DEFAULT 0,
  `createdAt` DATETIME NOT NULL,
  `publishedAt` DATETIME NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_review_product` (`productId` ASC),
  CONSTRAINT `fk_review_product`
    FOREIGN KEY (`productId`)
    REFERENCES `shop`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `shop`.`product_review` 
ADD INDEX `idx_review_parent` (`parentId` ASC);
ALTER TABLE `shop`.`product_review` 
ADD CONSTRAINT `fk_review_parent`
  FOREIGN KEY (`parentId`)
  REFERENCES `shop`.`product_review` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

