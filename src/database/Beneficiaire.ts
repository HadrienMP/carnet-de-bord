import objection, { ColumnNameMappers } from 'objection';
import type { Adresse, Contact, EtatCivile, IBeneficiaire } from 'src/global';
import knex from './knex';

const { Model, snakeCaseMappers } = objection;

Model.knex(knex);

export default class Beneficiaire extends Model implements IBeneficiaire {
	id!: string;
	numeroCaf: string;
	numeroPe: string;

	etatCivile!: EtatCivile;
	adresse!: Adresse;
	contact!: Contact;

	static tableName = 'beneficiaire';

	static get columnNameMappers(): ColumnNameMappers {
		return snakeCaseMappers();
	}

	static jsonSchema = {
		type: 'object',
		properties: {
			id: { type: 'string' },
			adresse: {
				type: 'object',
				properties: {
					codePostal: { type: 'string' },
					commune: { type: 'string' },
					voie: { type: 'string' }
				}
			},
			etatCivile: {
				type: 'object',
				properties: {
					civilite: { type: 'string' },
					nom: { type: 'string' },
					prenom: { type: 'string' }
				}
			},
			contact: {
				type: 'object',
				properties: {
					telPortable: { type: 'string' },
					email: { type: 'string' }
				}
			}
		}
	};
}
