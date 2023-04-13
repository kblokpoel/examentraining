<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230413103528 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE episode ADD CONSTRAINT FK_DDAA1CDAD94388BD FOREIGN KEY (serie_id) REFERENCES serie (id)');
        $this->addSql('CREATE INDEX IDX_DDAA1CDAD94388BD ON episode (serie_id)');
        $this->addSql('ALTER TABLE serie ADD genre_id INT NOT NULL');
        $this->addSql('ALTER TABLE serie ADD CONSTRAINT FK_AA3A93344296D31F FOREIGN KEY (genre_id) REFERENCES genre (id)');
        $this->addSql('CREATE INDEX IDX_AA3A93344296D31F ON serie (genre_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE episode DROP FOREIGN KEY FK_DDAA1CDAD94388BD');
        $this->addSql('DROP INDEX IDX_DDAA1CDAD94388BD ON episode');
        $this->addSql('ALTER TABLE serie DROP FOREIGN KEY FK_AA3A93344296D31F');
        $this->addSql('DROP INDEX IDX_AA3A93344296D31F ON serie');
        $this->addSql('ALTER TABLE serie DROP genre_id');
    }
}
